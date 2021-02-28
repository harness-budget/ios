//
//  ContentView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			VStack{
				SpendRingView(goalProgress: Binding.constant(CGFloat(0.80)), spendProgress: Binding.constant(CGFloat(0.70)), fundsRemaining: Binding.constant(30024))
					.padding(.top, 36.0)
				HStack {
					VStack(alignment: .leading) {
						Text("Set aside")
							.font(.title2)
							.fontWeight(.semibold)
						ScrollView(.horizontal) {
							HStack(alignment: .top){
								GoalRingView(goalProgress: Binding.constant(0.45), goalValue: Binding.constant(300_00), goalName: Binding.constant("New Computer"))
								GoalRingView(goalProgress: Binding.constant(0.45), goalValue: Binding.constant(300_00), goalName: Binding.constant("Valentine’s Day"))
								GoalRingView(goalProgress: Binding.constant(0.45), goalValue: Binding.constant(300_00), goalName: Binding.constant("Rent"))
							}
						}
					}
				}
				.padding(.horizontal, 12.0)
				Spacer()
			}
			.navigationTitle("Your Spending")
			.toolbar {
				Button(action: {
					print("Settings tapped!")
				}) {
					Image(systemName: "gear")
				}
				Button(action: {
					print("Settings tapped!")
				}) {
					Text("Link Plaid")
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
