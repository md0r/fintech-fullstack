import Foundation
import Security

final class KeychainService {
    static let shared = KeychainService()
    private init() {}

    private enum Key {
        static let accessToken = "com.mihaidorhan.iOU.accessToken"
        static let refreshToken = "com.mihaidorhan.iOU.refreshToken"
    }

    var accessToken: String? {
        get { read(key: Key.accessToken) }
        set { newValue == nil ? delete(key: Key.accessToken) : save(newValue!, key: Key.accessToken) }
    }

    var refreshToken: String? {
        get { read(key: Key.refreshToken) }
        set { newValue == nil ? delete(key: Key.refreshToken) : save(newValue!, key: Key.refreshToken) }
    }

    func clearTokens() {
        accessToken = nil
        refreshToken = nil
    }

    // MARK: - Private

    private func save(_ value: String, key: String) {
        guard let data = value.data(using: .utf8) else { return }
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        let attributes: [CFString: Any] = [kSecValueData: data]

        if SecItemUpdate(query as CFDictionary, attributes as CFDictionary) == errSecItemNotFound {
            var insertQuery = query
            insertQuery[kSecValueData] = data
            SecItemAdd(insertQuery as CFDictionary, nil)
        }
    }

    private func read(key: String) -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        var result: AnyObject?
        guard SecItemCopyMatching(query as CFDictionary, &result) == errSecSuccess,
              let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }

    private func delete(key: String) {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
