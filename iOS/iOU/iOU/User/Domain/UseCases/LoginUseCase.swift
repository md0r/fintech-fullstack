import Foundation

final class LoginUseCase {
    private let authRepository: AuthRepositoryProtocol
    private let keychain: KeychainService

    init(authRepository: AuthRepositoryProtocol, keychain: KeychainService = .shared) {
        self.authRepository = authRepository
        self.keychain = keychain
    }

    func execute(email: String, password: String) async throws -> AuthTokensEntity {
        let result = try await authRepository.login(email: email, password: password)
        keychain.accessToken = result.accessToken
        keychain.refreshToken = result.refreshToken
        return result
    }
}
