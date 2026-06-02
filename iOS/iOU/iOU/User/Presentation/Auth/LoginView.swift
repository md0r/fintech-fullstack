import FactoryKit
import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    let onNavigateToSignup: () -> Void

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
            Text("Welcome back")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Sign in to your iOU account")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var form: some View {
        VStack(spacing: 16) {
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
                textContentType: .password
            )

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            PrimaryButton(title: "Sign In", isLoading: viewModel.isLoading) {
                Task { await viewModel.login() }
            }
        }
    }

    private var footer: some View {
        HStack(spacing: 4) {
            Text("Don't have an account?")
                .foregroundStyle(.secondary)
            Button("Sign Up", action: onNavigateToSignup)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
    }
}
