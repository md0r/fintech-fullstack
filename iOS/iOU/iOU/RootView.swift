import FactoryKit
import SwiftUI

struct RootView: View {
    @State private var isAuthenticated = KeychainService.shared.accessToken != nil
    @State private var coordinator = AuthCoordinator()

    var body: some View {
        if isAuthenticated {
            // TODO: replace with MainTabView once it exists
            Text("You're in!")
        } else {
            authFlow
                .onReceive(NotificationCenter.default.publisher(for: .authDidSucceed)) { _ in
                    withAnimation { isAuthenticated = true }
                }
        }
    }

    @ViewBuilder
    private var authFlow: some View {
        switch coordinator.currentScreen {
        case .login:
            LoginView(onNavigateToSignup: { coordinator.showSignup() })
                .transition(.asymmetric(
                    insertion: .move(edge: .leading),
                    removal: .move(edge: .trailing)
                ))

        case .signup:
            SignupView(onNavigateToLogin: { coordinator.showLogin() })
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .leading)
                ))
        }
    }
}
