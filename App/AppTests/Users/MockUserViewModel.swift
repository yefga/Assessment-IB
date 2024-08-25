import SwiftUI
@testable import App

@MainActor
class MockUserViewModel: UserListViewModelProtocol {
    
    var state = UserState()
    
    var fetchUsersToReturn: Result<[User], Error> = .success([])
    var fetchUsersCalled = false
    
    func fetchUsers() async {
        fetchUsersCalled = true
        state.isLoading = true
        
        switch fetchUsersToReturn {
        case .success(let users):
            state.users = users
            state.error = nil
        case .failure(let error):
            state.users = []
            state.error = error
        }
        
        state.isLoading = false
    }
    
    func searchUser(detail: String) async {
        
    }
    
}
