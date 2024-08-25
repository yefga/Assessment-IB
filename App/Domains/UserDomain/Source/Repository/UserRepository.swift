import Foundation

protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
