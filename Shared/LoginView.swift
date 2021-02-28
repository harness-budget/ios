//
//  LoginView.swift
//  Harness
//
//  Created by Charlie Welsh on 2/27/21.
//

import SwiftUI
import PhoneNumberKit

struct LoginView: View {
    @State var phoneNumber = "+15128409935"
    
    @State private var shouldEnterCode = false
    
    var network: Network
    
    var onFinish: (String) -> ()

    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				Text("We're going to need to send your phone a verification code. We won't sell your information.")
				PhoneTextView()
					.padding(.vertical, 64.0)
					.fixedSize(horizontal: false, vertical: true)
				Spacer()
                
                NavigationLink("", destination: EnterCodeView(phoneNumber: $phoneNumber, network: Network(), onFinish: onFinish), isActive: $shouldEnterCode)
				
                Button (action: {
                    network.apollo.perform(mutation: SendLoginCodeMutation(phone: phoneNumber), resultHandler: {_ in
                        shouldEnterCode = true
                    })
                }, label: {
					HStack {
						Spacer()
						Text("Next")
							.fontWeight(.semibold)
							.padding()
						Spacer()
					}
					.cornerRadius(8.0)
				})
				.background(Color.blue)
				.foregroundColor(.white)
				.cornerRadius(12.0)
				.padding()
			}
			.padding(.horizontal, 16)
			.navigationTitle("Welcome")
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView( network: Network(), onFinish: {_ in })
    }
}
