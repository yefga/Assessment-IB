//
//  AppApp.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

@main
struct AssessmentIBApp: App {
    
    var UserList: some View {
        let dataSource = APIUserDataSource()
        let repository = UserRepositoryImpl(dataSource: dataSource)
        let useCase = FetchUsersUseCaseImpl(userRepository: repository)

        return UserListScreen(fetchUsersUseCase: useCase)
    }
    
    var body: some Scene {
        WindowGroup {
            UserList
        }
    }
}
