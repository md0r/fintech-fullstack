import Apollo
import ApolloAPI
import Foundation

struct AuthInterceptor: HTTPInterceptor {
    private let keychain: KeychainService

    init(keychain: KeychainService) {
        self.keychain = keychain
    }

    func intercept(request: URLRequest, next: NextHTTPInterceptorFunction) async throws -> HTTPResponse {
        var mutableRequest = request
        if let token = keychain.accessToken {
            mutableRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return try await next(mutableRequest)
    }
}

struct AuthInterceptorProvider: InterceptorProvider {
    private let keychain: KeychainService

    init(keychain: KeychainService) {
        self.keychain = keychain
    }

    func httpInterceptors<Operation: GraphQLOperation>(
        for operation: Operation
    ) -> [any HTTPInterceptor] {
        [AuthInterceptor(keychain: keychain), ResponseCodeInterceptor()]
    }
}
