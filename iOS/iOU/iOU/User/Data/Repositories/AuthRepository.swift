import Foundation

final class AuthRepository: AuthRepositoryProtocol {
    private let remoteDataSource: AuthRemoteDataSource

    init(remoteDataSource: AuthRemoteDataSource = AuthRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }

    func login(email: String, password: String) async throws -> AuthTokensEntity {
        try await remoteDataSource.login(email: email, password: password)
    }

    func signup(email: String, password: String, firstName: String, lastName: String) async throws -> AuthTokensEntity {
        try await remoteDataSource.signup(email: email, password: password, firstName: firstName, lastName: lastName)
    }

    func refreshToken(_ token: String) async throws -> AuthTokensEntity {
        try await remoteDataSource.refreshToken(token)
    }

    func logout() async throws {
        try await remoteDataSource.logout()
    }
}
