//
//  TransactionService.swift
//  VulnerableSocialBank
//
//  Created by Andrii Prokofiev on 18.01.2026.
//

import Foundation

class TransactionService {
    func findTransaction(userId: String) {
        // M6: Inadequate Privacy Controls
        // PII (User ID) is leaked directly into system logs via print(). [7, 8]
        print("Searching transactions for user: \(userId)")
        
        // M4: Insufficient Input Validation (SQL Injection)
        // Using string interpolation in a database query allows SQL injection.
        let query = "SELECT * FROM history WHERE user_id = '\(userId)'"
        // Database.execute(query)
    }
}
