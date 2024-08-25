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
    
    
    static var mock: [Self] {
        return [
            User(
                id: 1,
                name: "John Doe",
                username: "johndoe",
                email: "johndoe@example.com",
                address: "123 Main St, Anytown, USA",
                phone: "+1 234-567-8900",
                website: "https://johndoe.com",
                company: "Acme Corporation",
                image: UIImage(named: "johndoe.jpg")?.pngData()
            ),
            User(
                id: 2,
                name: "Jane Smith",
                username: "janesmith",
                email: "janesmith@example.com",
                address: "456 Elm St, Anytown, USA",
                phone: "+1 234-567-8901",
                website: "https://janesmith.com",
                company: "Tech Solutions",
                image: UIImage(named: "janesmith.jpg")?.pngData()
            ),
            User(
                id: 3,
                name: "Michael Johnson",
                username: "michaeljohnson",
                email: "michaeljohnson@example.com",
                address: "789 Oak St, Anytown, USA",
                phone: "+1 234-567-8902",
                website: "https://michaeljohnson.com",
                company: "Innovative Ventures",
                image: UIImage(named: "michaeljohnson.jpg")?.pngData()
            ),
            User(
                id: 4,
                name: "Emily Davis",
                username: "emilydavis",
                email: "emilydavis@example.com",
                address: "101 Pine St, Anytown, USA",
                phone: "+1 234-567-8903",
                website: "https://emilydavis.com",
                company: "Creative Designs",
                image: UIImage(named: "emilydavis.jpg")?.pngData()
            ),
            User(
                id: 5,
                name: "David Lee",
                username: "davidlee",
                email: "davidlee@example.com",
                address: "202 Maple St, Anytown, USA",
                phone: "+1 234-567-8904",
                website: "https://davidlee.com",
                company: "Global Solutions",
                image: UIImage(named: "davidlee.jpg")?.pngData()
            )
        ]
    }
}
