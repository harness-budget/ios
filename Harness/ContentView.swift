//
//  ContentView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView{
			VStack{
			SpendRingView(goalProgress: Binding.constant(CGFloat(0.80)), spendProgress: Binding.constant(CGFloat(0.70)), fundsRemaining: Binding.constant(30024))
				
				
			}
			.navigationTitle("Your Spending")
			.toolbar {
				Button(action: {
					print("Settings tapped!")
				}) {
					Image(systemName: "gear")
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
