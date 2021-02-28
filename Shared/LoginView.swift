//
//  LoginView.swift
//  Harness
//
//  Created by Charlie Welsh on 2/27/21.
//

import SwiftUI
import PhoneNumberKit

struct LoginView: View {
    @State private var phoneNumber: String? = nil
    
    var network: Network
    
    var onFinish: (String) -> ()

    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				Text("We're going to need to send your phone a verification code. We won't sell your information.")
				let phone_number = PhoneTextView()
					
                phone_number.padding(.vertical, 64.0)
					.fixedSize(horizontal: false, vertical: true)
                
				Spacer()
                
                if phoneNumber != nil {
                    NavigationLink("", destination: EnterCodeView(
                        phoneNumber: phoneNumber!,
                        network: network,
                        onFinish: onFinish
                    ), isActive: Binding.constant(true))
                }
				
                Button (action: {
                    phoneNumber = PhoneNumberKit().format(phone_number.textView.phoneNumber!, toType: .e164);
                    network.apollo.perform(mutation: SendLoginCodeMutation(phone: phoneNumber!), resultHandler: {_ in
                        
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
