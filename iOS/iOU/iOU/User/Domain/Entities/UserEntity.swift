import Foundation

struct UserEntity {
    let id: String
    let email: String
    let firstName: String
    let lastName: String
    let isActive: Bool
    let createdAt: String
    let updatedAt: String

    var fullName: String { "\(firstName) \(lastName)" }
}
