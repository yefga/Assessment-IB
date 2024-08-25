import Foundation

struct UserMapper {
    static func mapToDomain(dto: UserDTO) -> User {
        let address = """
        \(dto.address?.street ?? .emptyString)
        \(dto.address?.suite ?? .emptyString)
        \(dto.address?.city ?? .emptyString)
        \(dto.address?.zipcode ?? .emptyString)
        """
        return User.init(
            id: dto.id,
            name: dto.name,
            username: dto.username,
            email: dto.email,
            address: address,
            phone: dto.phone,
            website: dto.website,
            company: dto.company?.name
        )
    }
    
    static func mapToDomain(dtos: [UserDTO]) -> [User] {
        return dtos.map(mapToDomain)
    }
}
