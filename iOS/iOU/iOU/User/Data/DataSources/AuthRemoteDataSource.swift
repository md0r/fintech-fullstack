import Apollo
import ApolloAPI
import Foundation

final class AuthRemoteDataSource {
    private let apollo: ApolloClient

    init(apollo: ApolloClient = ApolloClientProvider.shared.client) {
        self.apollo = apollo
    }

    func login(email: String, password: String) async throws -> AuthTokensEntity {
        let response = try await apollo.perform(mutation: IOUAPI.LoginMutation(
            loginInput: .init(email: email, password: password)
        ))
        return try unwrap(response).login.toEntity()
    }

    func signup(email: String, password: String, firstName: String, lastName: String) async throws -> AuthTokensEntity {
        let response = try await apollo.perform(mutation: IOUAPI.SignupMutation(
            signupInput: .init(email: email, firstName: firstName, lastName: lastName, password: password)
        ))
        return try unwrap(response).signup.toEntity()
    }

    func refreshToken(_ token: String) async throws -> AuthTokensEntity {
        let response = try await apollo.perform(mutation: IOUAPI.RefreshTokenMutation(
            refreshTokenInput: .init(refreshToken: token)
        ))
        return try unwrap(response).refreshToken.toEntity()
    }

    func logout() async throws {
        _ = try await apollo.perform(mutation: IOUAPI.LogoutMutation())
    }

    private func unwrap<O: GraphQLOperation>(_ response: GraphQLResponse<O>) throws -> O.Data {
        if let errors = response.errors, !errors.isEmpty {
            throw NetworkError.graphQLErrors(errors.compactMap { $0.message })
        }
        guard let data = response.data else {
            throw NetworkError.graphQLErrors(["No data returned"])
        }
        return data
    }
}

// MARK: - Mapping generated Apollo types → domain entities

private extension IOUAPI.LoginMutation.Data.Login {
    func toEntity() -> AuthTokensEntity {
        AuthTokensEntity(accessToken: accessToken, refreshToken: refreshToken, user: user.toEntity())
    }
}

private extension IOUAPI.SignupMutation.Data.Signup {
    func toEntity() -> AuthTokensEntity {
        AuthTokensEntity(accessToken: accessToken, refreshToken: refreshToken, user: user.toEntity())
    }
}

private extension IOUAPI.RefreshTokenMutation.Data.RefreshToken {
    func toEntity() -> AuthTokensEntity {
        AuthTokensEntity(accessToken: accessToken, refreshToken: refreshToken, user: user.toEntity())
    }
}

private extension IOUAPI.LoginMutation.Data.Login.User {
    func toEntity() -> UserEntity {
        UserEntity(id: id, email: email, firstName: firstName, lastName: lastName,
                   isActive: isActive, createdAt: createdAt, updatedAt: updatedAt)
    }
}

private extension IOUAPI.SignupMutation.Data.Signup.User {
    func toEntity() -> UserEntity {
        UserEntity(id: id, email: email, firstName: firstName, lastName: lastName,
                   isActive: isActive, createdAt: createdAt, updatedAt: updatedAt)
    }
}

private extension IOUAPI.RefreshTokenMutation.Data.RefreshToken.User {
    func toEntity() -> UserEntity {
        UserEntity(id: id, email: email, firstName: firstName, lastName: lastName,
                   isActive: isActive, createdAt: createdAt, updatedAt: updatedAt)
    }
}
