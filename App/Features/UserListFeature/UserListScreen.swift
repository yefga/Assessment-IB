//
//  UserListScreen.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct UserListScreen: View {
    @StateObject private var viewModel: UserListViewModel
    @State private(set) var selectedUser: User?
    @State private(set) var profileImage: UIImage?
    
    init(
        fetchUsersUseCase: FetchUsersUseCase
    ) {
        _viewModel = StateObject(
            wrappedValue: UserListViewModel(
                fetchUsersUseCase: fetchUsersUseCase
            )
        )
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HeaderView
                    .padding(
                        EdgeInsets.init(
                            top: 32,
                            leading: 20,
                            bottom: 32,
                            trailing: 20
                        )
                    )
                SectionTitle
                Group {
                    Binding
                }
                
                .background(Color.white)
            }.background(Color.background.colorFormat)
        }
        .task {
            await viewModel.fetchUsers()
        }
        
    }
    
    var SectionTitle: some View {
        HStack {
            Text(viewModel.search.isEmpty ? "All Users".uppercased() : "Search Results".uppercased())
                .font(.workSans(type: .semiBold, size: .medium))
                .padding(
                    EdgeInsets.init(
                        top: 9,
                        leading: 20,
                        bottom: 9,
                        trailing: 20
                    )
                )
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .topBottomBorder(color: .black, width: 1.0)
        .background(Color.white100.colorFormat)
    }
    
    private var Binding: some View {
        ScrollView {
           if let error = viewModel.state.error {
                switch error {
                case .noInternet:
                    BlankView(
                        data: .init(
                            title: "Your World, Offline",
                            subtitle: "Discover Hidden Gems, Explore New Horizons with Internet",
                            image: "image_offline"
                        )
                    )
                    .padding(50)
                default:
                    BlankView(
                        data: .init(
                            title: "Uh-oh! Lost in Space",
                            subtitle: "We couldn't find that page. Let's try another one.",
                            image: "image_not_found"
                        )
                    )
                    .padding(50)
                }
                
            } else {
                VStack(spacing: 20) {
                    ForEach(viewModel.state.users, id: \.id) { user in
                        UserItemView(
                            data: .init(
                                name: user.name.orValue(.emptyString),
                                userName: user.username.orValue(.emptyString), 
                                photo: user.image
                            ),
                            isLoading: viewModel.state.isLoading
                        )
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            selectedUser = user
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .sheet(item: $selectedUser, onDismiss: {
                    selectedUser = nil
                }, content: { user in
                    UserDetailScreen(user: user)
                })
            }
            
            
        }.background(Color.background.colorFormat)
    }
    
    private var HeaderView: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Users").font(
                .workSans(
                    type: .semiBold,
                    size: .large
                )
            )
            SearchView { user in
                Task {
                    await viewModel.searchUser(detail: user)
                }
            }
        }
    }
}

#Preview {
    let dataSource = APIUserDataSource()
    let repository = UserRepositoryImpl(dataSource: dataSource)
    let useCase = FetchUsersUseCaseImpl(userRepository: repository)
    
    return UserListScreen(fetchUsersUseCase: useCase)
}
