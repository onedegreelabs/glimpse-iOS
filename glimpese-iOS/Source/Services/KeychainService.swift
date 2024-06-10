//
//  KeychainService.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/15/24.
//

import Foundation
import Security

class KeychainService {

    static let service = "YourApp"
    static let account = "UserAccessToken"

    class func saveToken(_ token: String) {
        guard let data = token.data(using: .utf8) else { return }

        // MARK: Delete any existing token
        deleteToken()

        // MARK: Create a new keychain item
        var query = [String: Any]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrService as String] = service
        query[kSecAttrAccount as String] = account
        query[kSecValueData as String] = data

        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Failed to save token in keychain")
            return
        }
        print("Token saved in keychain")
    }

    class func getToken() -> String? {
        var query = [String: Any]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrService as String] = service
        query[kSecAttrAccount as String] = account
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecMatchLimit as String] = kSecMatchLimitOne

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess, let tokenData = item as? Data else {
            return nil
        }

        return String(data: tokenData, encoding: .utf8)
    }

    class func deleteToken() {
        var query = [String: Any]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrService as String] = service
        query[kSecAttrAccount as String] = account

        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            print("Failed to delete token from keychain")
            return
        }
        print("Token deleted from keychain")
    }
}
