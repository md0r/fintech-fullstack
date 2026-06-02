import Foundation

protocol AuthRepositoryProtocol {
    func login(email: String, password: String) async throws -> AuthTokensEntity
    func signup(email: String, password: String, firstName: String, lastName: String) async throws -> AuthTokensEntity
    func refreshToken(_ token: String) async throws -> AuthTokensEntity
    func logout() async throws
}
