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

    func login() async {
        guard isFormValid else { return }
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            _ = try await loginUseCase.execute(
                email: email.trimmingCharacters(in: .whitespaces),
                password: password
            )
            NotificationCenter.default.post(name: .authDidSucceed, object: nil)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
