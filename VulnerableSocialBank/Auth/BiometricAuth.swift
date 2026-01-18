//
//  BiometricAuth.swift
//  VulnerableSocialBank
//
//  Created by Andrii Prokofiev on 18.01.2026.
//

import LocalAuthentication

class BiometricAuthService {
    func loginUser() {
        let context = LAContext()
        // M3: Insecure Authentication
        // It should be linked to a Keychain key to be secure.
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Access your bank") { success, _ in
            if success {
                print("Access Granted (Insecurely)")
            }
        }
    }
}
