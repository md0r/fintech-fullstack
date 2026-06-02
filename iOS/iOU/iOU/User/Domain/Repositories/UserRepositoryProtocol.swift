import Foundation

protocol UserRepositoryProtocol {
    func getMe() async throws -> UserEntity
    func updateUser(firstName: String?, lastName: String?) async throws -> UserEntity
    func changePassword(oldPassword: String, newPassword: String) async throws
    func deleteAccount() async throws
}
