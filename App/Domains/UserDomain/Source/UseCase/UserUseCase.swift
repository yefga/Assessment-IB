import Foundation

protocol FetchUsersUseCase {
    func execute() async throws -> [User]
}
