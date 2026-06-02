import FactoryKit
import SwiftUI

@Observable
final class LoginViewModel {
    var email = ""
    var password = ""
    var isLoading = false
    var errorMessage: String?

    var isFormValid: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
        !password.isEmpty
    }

    @ObservationIgnored
    @Injected(\.loginUseCase) private var loginUseCase

    var onLoginSuccess: ((AuthTokensEntity) -> Void)?

    func login() async {
        guard isFormValid else { return }
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let result = try await loginUseCase.execute(
                email: email.trimmingCharacters(in: .whitespaces),
                password: password
            )
            onLoginSuccess?(result)
            NotificationCenter.default.post(name: .authDidSucceed, object: nil)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
