//
//  UserImplementation.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import Foundation

class FetchUsersUseCaseImpl: FetchUsersUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        return try await userRepository.fetchUsers()
    }
}
