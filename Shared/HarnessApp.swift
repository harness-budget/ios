//
//  HarnessApp.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI
import KeychainAccess

enum AppState {
    case Loaded(DashboardQuery.Data)
    case Authenticated
    case Unauthenticated
}

@main
struct HarnessApp: App {
    @State var network: Network = Network()
    @State var state: AppState = .Unauthenticated
    
	var body: some Scene {
		WindowGroup {
            if network.authenticated {
                DashboardView(network: network)
            } else {
                LoginView(network: network, onFinish: { authToken in
                    do {
                        try Keychain(server: "https://harnessbudget.com", protocolType: .https)
                            .accessibility(.whenUnlocked)
                            .set(authToken, key: "harness-budget-token")
                        
                    } catch let error {
                        print("error: \(error)")
                    }
                    
                    network = Network()
                })
            }
		}
	}
    
    
}
