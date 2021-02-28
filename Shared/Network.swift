//
//  Network.swift
//  Harness
//
//  Created by Andrew Carter on 2/28/21.
//

import Foundation
import Apollo
import KeychainAccess

struct Network {
    let apollo: ApolloClient
    let authenticated: Bool
    
    init() {
        let authToken = try? Keychain(server: "https://harnessbudget.com", protocolType: .https)
                .accessibility(.whenUnlocked)
                .get("harness-budget-tokena")
        
        var headers: [String:String] = [:]
        if let authToken = authToken {
            headers["Authorization"] = "Bearer \(authToken)"
            self.authenticated = true
        } else {
            self.authenticated = false
        }
        
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = LegacyInterceptorProvider(store: store)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: URL(string: "https://api.harnessbudget.com/graphql")!, additionalHeaders: headers)
        
        self.apollo = ApolloClient(networkTransport: transport, store: store)
    }
}
