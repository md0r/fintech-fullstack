import Foundation

enum NetworkError: Error, LocalizedError {
    case graphQLErrors([String])
    case unauthorized
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .graphQLErrors(let messages):
            return messages.first ?? "An error occurred."
        case .unauthorized:
            return "Session expired. Please log in again."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
