import Apollo
import ApolloAPI
import Foundation

final class UserRemoteDataSource {
    private let apollo: ApolloClient

    init(apollo: ApolloClient = ApolloClientProvider.shared.client) {
        self.apollo = apollo
    }

    func getMe() async throws -> UserEntity {
        let response = try await apollo.fetch(query: IOUAPI.GetMeQuery(), cachePolicy: .networkOnly)
        return try unwrap(response).getMe.toEntity()
    }

    func updateUser(firstName: String?, lastName: String?) async throws -> UserEntity {
        let input = IOUAPI.UpdateUserInput(
            firstName: firstName.map { .some($0) } ?? .none,
            lastName: lastName.map { .some($0) } ?? .none
        )
        let response = try await apollo.perform(mutation: IOUAPI.UpdateUserMutation(updateUserInput: input))
        return try unwrap(response).updateUser.toEntity()
    }

    func changePassword(oldPassword: String, newPassword: String) async throws {
        _ = try await apollo.perform(mutation: IOUAPI.ChangePasswordMutation(
            changePasswordInput: .init(newPassword: newPassword, oldPassword: oldPassword)
        ))
    }

    func deleteAccount() async throws {
        _ = try await apollo.perform(mutation: IOUAPI.DeleteAccountMutation())
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

private extension IOUAPI.GetMeQuery.Data.GetMe {
    func toEntity() -> UserEntity {
        UserEntity(id: id, email: email, firstName: firstName, lastName: lastName,
                   isActive: isActive, createdAt: createdAt, updatedAt: updatedAt)
    }
}

private extension IOUAPI.UpdateUserMutation.Data.UpdateUser {
    func toEntity() -> UserEntity {
        UserEntity(id: id, email: email, firstName: firstName, lastName: lastName,
                   isActive: isActive, createdAt: createdAt, updatedAt: updatedAt)
    }
}
