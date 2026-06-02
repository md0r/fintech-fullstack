import Foundation

final class LogoutUseCase {
    private let authRepository: AuthRepositoryProtocol
    private let keychain: KeychainService

    init(authRepository: AuthRepositoryProtocol, keychain: KeychainService = .shared) {
        self.authRepository = authRepository
        self.keychain = keychain
    }

    func execute() async throws {
        try await authRepository.logout()
        keychain.clearTokens()
    }
}
