import FactoryKit
import SwiftUI

struct SignupView: View {
    @State private var viewModel = SignupViewModel()
    let onNavigateToLogin: () -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                header
                form
                footer
            }
            .padding(.horizontal, 24)
            .padding(.top, 60)
        }
        .scrollBounceBehavior(.basedOnSize)
    }

    private var header: some View {
        VStack(spacing: 8) {
            Text("Create account")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Start tracking your shared expenses")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var form: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                AuthTextField(
                    title: "First Name",
                    text: $viewModel.firstName,
                    textContentType: .givenName
                )
                AuthTextField(
                    title: "Last Name",
                    text: $viewModel.lastName,
                    textContentType: .familyName
                )
            }

            AuthTextField(
                title: "Email",
                text: $viewModel.email,
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )

            AuthTextField(
                title: "Password",
                text: $viewModel.password,
                isSecure: true,
                textContentType: .newPassword
            )

            AuthTextField(
                title: "Confirm Password",
                text: $viewModel.confirmPassword,
                isSecure: true,
                textContentType: .newPassword
            )

            if viewModel.passwordMismatch {
                Text("Passwords do not match.")
                    .font(.caption)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            PrimaryButton(title: "Create Account", isLoading: viewModel.isLoading) {
                Task { await viewModel.signup() }
            }
        }
    }

    private var footer: some View {
        HStack(spacing: 4) {
            Text("Already have an account?")
                .foregroundStyle(.secondary)
            Button("Sign In", action: onNavigateToLogin)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
    }
}
