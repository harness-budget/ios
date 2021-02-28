//
//  LoginView.swift
//  Harness
//
//  Created by Charlie Welsh on 2/27/21.
//

import SwiftUI
import PhoneNumberKit

struct LoginView: View {

    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				Text("We're going to need to send your phone a verification code. We won't sell your information.")
				PhoneTextView()
					.padding(.vertical, 64.0)
					.fixedSize(horizontal: false, vertical: true)
				Spacer()
				
				Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
				.cornerRadius(8.0)
				.padding()
			}
			.padding(.horizontal, 16)
			.navigationTitle("Welcome")
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
