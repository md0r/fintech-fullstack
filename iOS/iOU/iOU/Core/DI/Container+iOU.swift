import Apollo
import FactoryKit

@MainActor
extension Container {

    // MARK: - Core

    var keychainService: Factory<KeychainService> {
        self { KeychainService.shared }.singleton
    }

    var apolloClient: Factory<ApolloClient> {
        self { ApolloClientProvider.shared.client }.singleton
    }

    // MARK: - Data sources

    var authRemoteDataSource: Factory<AuthRemoteDataSource> {
        self { AuthRemoteDataSource(apollo: self.apolloClient()) }.singleton
    }

    var userRemoteDataSource: Factory<UserRemoteDataSource> {
        self { UserRemoteDataSource(apollo: self.apolloClient()) }.singleton
    }

    // MARK: - Repositories

    var authRepository: Factory<any AuthRepositoryProtocol> {
        self { AuthRepository(remoteDataSource: self.authRemoteDataSource()) }.singleton
    }

    var userRepository: Factory<any UserRepositoryProtocol> {
        self { UserRepository(remoteDataSource: self.userRemoteDataSource()) }.singleton
    }

    // MARK: - Use cases

    var loginUseCase: Factory<LoginUseCase> {
        self { LoginUseCase(authRepository: self.authRepository()) }
    }

    var signupUseCase: Factory<SignupUseCase> {
        self { SignupUseCase(authRepository: self.authRepository()) }
    }

    var logoutUseCase: Factory<LogoutUseCase> {
        self { LogoutUseCase(authRepository: self.authRepository()) }
    }

    var refreshTokenUseCase: Factory<RefreshTokenUseCase> {
        self { RefreshTokenUseCase(authRepository: self.authRepository()) }
    }

    // MARK: - View models

    var loginViewModel: Factory<LoginViewModel> {
        self { LoginViewModel() }
    }

    var signupViewModel: Factory<SignupViewModel> {
        self { SignupViewModel() }
    }
}
