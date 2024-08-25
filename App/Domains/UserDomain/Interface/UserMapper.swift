import Foundation

struct UserMapper {
    static func mapToDomain(dto: UserDTO) -> User {
        return User.init(
            id: dto.id,
            name: dto.name,
            username: dto.username,
            email: dto.email,
            address: dto.address?.street,
            phone: dto.phone,
            website: dto.website,
            company: dto.company?.name
        )
    }
    
    static func mapToDomain(dtos: [UserDTO]) -> [User] {
        return dtos.map(mapToDomain)
    }
}
