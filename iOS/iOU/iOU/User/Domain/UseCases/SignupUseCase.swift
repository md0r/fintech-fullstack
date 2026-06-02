import Foundation

final class SignupUseCase {
    private let authRepository: AuthRepositoryProtocol
    private let keychain: KeychainService

    init(authRepository: AuthRepositoryProtocol, keychain: KeychainService = .shared) {
        self.authRepository = authRepository
        self.keychain = keychain
    }

    func execute(email: String, password: String, firstName: String, lastName: String) async throws -> AuthTokensEntity {
        let result = try await authRepository.signup(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName
        )
        keychain.accessToken = result.accessToken
        keychain.refreshToken = result.refreshToken
        return result
    }
}
