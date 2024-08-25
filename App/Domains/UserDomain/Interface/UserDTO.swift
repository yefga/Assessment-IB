import Foundation

// MARK: - WelcomeElement
struct UserDTO: Codable {
    let id: Int?
    let name, username, email: String?
    let address: AddressDTO?
    let phone, website: String?
    let company: CompanyDTO?
}

// MARK: - Address
struct AddressDTO: Codable {
    let street, suite, city, zipcode: String?
    let geo: GeoDTO?
}

// MARK: - Geo
struct GeoDTO: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct CompanyDTO: Codable {
    let name, catchPhrase, bs: String?
}
