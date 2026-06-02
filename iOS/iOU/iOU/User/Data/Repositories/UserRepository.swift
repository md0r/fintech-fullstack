import Foundation

final class UserRepository: UserRepositoryProtocol {
    private let remoteDataSource: UserRemoteDataSource

    init(remoteDataSource: UserRemoteDataSource = UserRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }

    func getMe() async throws -> UserEntity {
        try await remoteDataSource.getMe()
    }

    func updateUser(firstName: String?, lastName: String?) async throws -> UserEntity {
        try await remoteDataSource.updateUser(firstName: firstName, lastName: lastName)
    }

    func changePassword(oldPassword: String, newPassword: String) async throws {
        try await remoteDataSource.changePassword(oldPassword: oldPassword, newPassword: newPassword)
    }

    func deleteAccount() async throws {
        try await remoteDataSource.deleteAccount()
    }
}
