import SwiftUI

enum AuthScreen {
    case login
    case signup
}

@Observable
final class AuthCoordinator {
    var currentScreen: AuthScreen = .login

    func showLogin() { currentScreen = .login }
    func showSignup() { currentScreen = .signup }
}
