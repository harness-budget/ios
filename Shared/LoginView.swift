//
//  LoginView.swift
//  Harness
//
//  Created by Charlie Welsh on 2/27/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
		NavigationView {
			VStack {
				TextField("Test", text: Binding.constant(""))
				Spacer()
			}
			.navigationTitle("Welcome")
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
