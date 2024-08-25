import Foundation
import UIKit

// MARK: - WelcomeElement
struct User: Codable, Equatable, Identifiable {
    let id: Int?
    let name, username, email: String?
    let address: String?
    let phone, website: String?
    let company: String?
    var image: Data?
}
