//
//  UserRepositoryImpl.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let dataSource: UserDataSource
    
    init(dataSource: UserDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchUsers() async throws -> [User] {
        let userDTOs = try await dataSource.getUsers()
        return UserMapper.mapToDomain(dtos: userDTOs)
    }
}
