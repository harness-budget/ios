//
//  Network.swift
//  Harness
//
//  Created by Andrew Carter on 2/28/21.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.harnessbudget.com/graphql")!)
}
