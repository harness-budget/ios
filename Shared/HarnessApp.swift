//
//  HarnessApp.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

@main
struct HarnessApp: App {
    @State var authenticated: Bool = false
    
	var body: some Scene {
		WindowGroup {
            if authenticated {
                Text("YOU HAVE BEEN AUTHENTICATED")
            } else {
                LoginView(onFinish: { authToken in
                    Network(authToken: authToken).replaceSingleton()
                    // now let's transition to do the stuff
                    
                    authenticated = true
                })
            }
		}
	}
}
