//
//  LinkPlaid.swift
//  Harness (iOS)
//
//  Created by Ben Aubin on 2/28/21.
//

import Foundation
import LinkKit

import SwiftUI

class PlaidLinkVC: UIViewController {
    var network: Network!
    var handler: Handler!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        network.apollo.perform(mutation: CreatePlaidLinkTokenMutation(), resultHandler: {res in
            do {
                let linkToken = try res.get().data!.createPlaidLinkToken!.linkToken
                
                
                // Learn more about how to create a link_token at https://plaid.com/docs/#create-link-token
                let result = Plaid.create(LinkTokenConfiguration(token: linkToken, onSuccess: { res in
                    self.network.apollo.perform(mutation: LinkPlaidAccountMutation(publicToken: res.publicToken), resultHandler: {res in
                        self.dismiss(animated: false)
                    })
                }))
                
                switch result {
                    case .failure(let error):
                        print("Unable to create Plaid handler due to: \(error)")
                    case .success(let handler):
                        self.handler = handler
                        self.handler.open(presentUsing: .viewController(self))
                }
            } catch {
                print("\(error)")
            }
        })
    }
}
/// Controller object which providers interop between SwiftUI and traditional UIViewController delegate callbacks.
struct LinkController: UIViewControllerRepresentable {

    var network: Network
    
    func makeCoordinator() -> LinkController.Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PlaidLinkVC {
        let vc = PlaidLinkVC()
        vc.network = network
        return vc
    }
    
    func updateUIViewController(_ uiViewController: PlaidLinkVC, context: Context) {
        
    }
    
    class Coordinator: NSObject {
            var parent: LinkController
            
            init(_ parent: LinkController) {
                self.parent = parent
            }
        }
}
