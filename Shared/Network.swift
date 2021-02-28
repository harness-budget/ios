//
//  Network.swift
//  Harness
//
//  Created by Andrew Carter on 2/28/21.
//

import Foundation
import Apollo

class Network {
    static var shared = Network(authToken: nil)
    
    
    var authToken: String?;
    
    init(authToken: String?) {
        self.authToken = authToken
    }
    
    lazy var apollo: ApolloClient = {
        var headers: [String:String] = [:]
        if let authToken = authToken {
            headers["Authorization"] = "Bearer \(authToken)"
        }
        
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = LegacyInterceptorProvider(store: store)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: URL(string: "https://api.harnessbudget.com/graphql")!, additionalHeaders: headers)
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    func replaceSingleton() {
        Network.shared = self
    }
}
