import Foundation

final class RefreshTokenUseCase {
    private let authRepository: AuthRepositoryProtocol
    private let keychain: KeychainService

    init(authRepository: AuthRepositoryProtocol, keychain: KeychainService = .shared) {
        self.authRepository = authRepository
        self.keychain = keychain
    }

    func execute() async throws -> AuthTokensEntity {
        guard let token = keychain.refreshToken else {
            throw NetworkError.unauthorized
        }
        let result = try await authRepository.refreshToken(token)
        keychain.accessToken = result.accessToken
        keychain.refreshToken = result.refreshToken
        return result
    }
}
