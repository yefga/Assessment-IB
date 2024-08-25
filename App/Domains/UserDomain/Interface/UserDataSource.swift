import Foundation

protocol UserDataSource {
    func getUsers() async throws -> [UserDTO]
}

class APIUserDataSource: UserDataSource {
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let reachabilityManager = ReachabilityManager.shared

    func getUsers() async throws -> [UserDTO] {
        guard reachabilityManager.isNetworkAvailable else {
            throw NetworkError.noInternet
        }
        
        guard let url = URL(string: "\(baseURL)/users") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([UserDTO].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
