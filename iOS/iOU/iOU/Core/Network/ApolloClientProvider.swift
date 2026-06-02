import Apollo
import Foundation

final class ApolloClientProvider {
    static let shared = ApolloClientProvider()

    let client: ApolloClient

    private init() {
        let url = URL(string: "http://localhost:3000/graphql")!
        let store = ApolloStore()
        let transport = RequestChainNetworkTransport(
            urlSession: URLSession.shared,
            interceptorProvider: AuthInterceptorProvider(keychain: .shared),
            store: store,
            endpointURL: url
        )
        client = ApolloClient(networkTransport: transport, store: store)
    }
}
