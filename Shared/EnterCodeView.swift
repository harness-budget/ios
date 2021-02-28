//
//  EnterCodeView.swift
//  Harness
//
//  Created by Ben Aubin on 2/28/21.
//

import SwiftUI

struct EnterCodeView: View {
    var phoneNumber: String
    @State var code: String = ""
    @State var error: String = ""
    
    var network: Network
    var onFinish: (String) -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("We sent a verification code to \(phoneNumber). It should arrive in a few moments.")
            
            if error != "" { Text("Error: \(error)") }

            Spacer()

            TextField("Verification code", text: $code)
                .textContentType(.oneTimeCode)
                .font(.title)
                .minimumScaleFactor(0.5)
                .scaledToFit()

            Spacer()

            Button (action: {
                network.apollo.perform(mutation: LoginWithPhoneCodeMutation(phoneNumber: phoneNumber, code: code), resultHandler: { res in
                    
                    
                    do {
                        let data = try res.get().data!.loginWithPhoneCode!;
                        if let authToken = data.authToken {
                            onFinish(authToken)
                        } else {
                            error = data.errors!.joined(separator: " ")
                        }
                    } catch {
                        // error handling
                    }
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
        .navigationTitle("Verify Phone")
    }
}

struct EnterCodeView_Previews: PreviewProvider {
    static var previews: some View {
        EnterCodeView(phoneNumber: "(123) 555-5555", network: Network(), onFinish: {_ in })
    }
}
