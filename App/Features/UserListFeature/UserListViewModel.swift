import SwiftUI

struct UserState {
    var users: [User] = []
    var storedUsers: [User] = []
    var isLoading: Bool = false
    var error: NetworkError?
}

@MainActor
protocol UserListViewModelProtocol: ObservableObject {
    var state: UserState { get }
    func fetchUsers() async
    func searchUser(detail: String) async
}

// Use an actor to manage state safely
actor UserManager {
    private var users: [User]

    init(users: [User]) {
        self.users = users
    }

    func updateUserImage(userID: Int, imageData: Data?) {
        guard let index = users.firstIndex(where: { $0.id == userID }) else { return }
        users[index].image = imageData
    }

    func getUsers() -> [User] {
        return users
    }
}

@MainActor
class UserListViewModel: UserListViewModelProtocol {
    @Published private(set) var state = UserState()
    @Published var search: String = ""
    
    private let fetchUsersUseCase: FetchUsersUseCase
    
    init(fetchUsersUseCase: FetchUsersUseCase) {
        self.fetchUsersUseCase = fetchUsersUseCase
    }
    
    func fetchUsers() async {
        state.isLoading = true
        state.error = nil
        state.users = User.mock
        do {
            let users = try await fetchUsersUseCase.execute()
            let userManager = UserManager(users: users)
            // Fetch images in parallel
            await withTaskGroup(of: Void.self) { group in
                for user in users {
                    group.addTask {
                        if let image = await ImageDownloader.shared?.loadProfileImage() {
                            await userManager.updateUserImage(userID: user.id ?? 0, imageData: image.pngData())
                        }
                    }
                }
            }
            
            // Update state once all tasks are completed
            state.users = await userManager.getUsers()
            state.storedUsers = state.users
            state.isLoading = false

        } catch {
            guard let error = error as? NetworkError else { return }
            state.error = error
            state.isLoading = false
        }
    }
    
    func searchUser(detail: String) async {
        search = detail
        
        if detail.isEmpty {
            state.users = state.storedUsers
        }
        if detail.count >= 3 {
            state.users = state.storedUsers.filter {
                $0.name?.lowercased().contains(detail.lowercased()) ?? false || $0.username?.lowercased().contains(detail.lowercased()) ?? false
            }
        }
    }
}
