//
//  ContentView.swift
//  VulnerableSocialBank
//
//  Created by Andrii Prokofiev on 17.01.2026.
//

import SwiftUI

struct ContentView: View {
    // SwiftUI State Safety Rule
    // @State should be private to prevent external modification.
    @State var isUserAuthenticated: Bool = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Vulnerable Bank PoC")
               .font(.largeTitle)
            
            // M5: Insecure Communication
            // Using insecure HTTP protocol.
            Link("Visit Help Center (HTTP)", destination: URL(string: "http://insecure-bank-help.com")!)
               .foregroundColor(.red)

            Button("Test Vulnerabilities") {
                let service = TransactionService()
                service.findTransaction(userId: "admin' OR '1'='1")
            }
           .buttonStyle(.borderedProminent)
        }
       .padding()
    }
}
