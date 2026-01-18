//
//  CoreStorage.swift
//  VulnerableSocialBank
//
//  Created by Andrii Prokofiev on 18.01.2026.
//

import Foundation
import CommonCrypto

struct CoreConfig {
    // M1: Improper Credential Usage
    // Hardcoded secret key in source code.
    static let apiSecret = "sk_prod_vulnerable_key_8400_deadbeef"
}

class SessionManager {
    func saveSessionToken(_ token: String) {
        // M9: Insecure Data Storage
        // Sensitive token stored in plaintext UserDefaults instead of Keychain.
        UserDefaults.standard.set(token, forKey: "user_auth_token")
    }
    
    func hashSensitiveData(_ input: String) -> String {
        // M10: Insufficient Cryptography
        // MD5 is cryptographically broken and insecure for modern apps.
        let data = input.data(using:.utf8)!
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        _ = data.withUnsafeBytes { CC_MD5($0.baseAddress, CC_LONG(data.count), &digest) }
        return digest.map { String(format: "%02x", $0) }.joined()
    }
}
