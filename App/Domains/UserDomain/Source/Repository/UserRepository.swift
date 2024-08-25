import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
