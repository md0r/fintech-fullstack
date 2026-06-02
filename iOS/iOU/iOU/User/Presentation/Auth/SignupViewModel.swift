import FactoryKit
import SwiftUI

@Observable
final class SignupViewModel {
    var email = ""
    var password = ""
    var confirmPassword = ""
    var firstName = ""
    var lastName = ""
    var isLoading = false
    var errorMessage: String?

    var passwordMismatch: Bool {
        !confirmPassword.isEmpty && password != confirmPassword
    }

    var isFormValid: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
        !firstName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !lastName.trimmingCharacters(in: .whitespaces).isEmpty &&
        password.count >= 8 &&
        password == confirmPassword
    }

    @ObservationIgnored
    @Injected(\.signupUseCase) private var signupUseCase

    var onSignupSuccess: ((AuthTokensEntity) -> Void)?

    func signup() async {
        guard isFormValid else { return }
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let result = try await signupUseCase.execute(
                email: email.trimmingCharacters(in: .whitespaces),
                password: password,
                firstName: firstName.trimmingCharacters(in: .whitespaces),
                lastName: lastName.trimmingCharacters(in: .whitespaces)
            )
            onSignupSuccess?(result)
            NotificationCenter.default.post(name: .authDidSucceed, object: nil)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
