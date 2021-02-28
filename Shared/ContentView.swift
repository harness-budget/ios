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
				HStack {
					VStack(alignment: .leading) {
						Text("Set aside")
							.font(.title2)
							.fontWeight(.semibold)
						HStack {
							GoalRingView(goalProgress: Binding.constant(0.45), goalValue: Binding.constant(300_00))
								.padding(.trailing, 16.0)
							GoalRingView(goalProgress: Binding.constant(0.45), goalValue: Binding.constant(300_00))
								.padding(.trailing, 16.0)
							GoalRingView(goalProgress: Binding.constant(0.45), goalValue: Binding.constant(300_00))
								.padding(.trailing, 16.0)
						}
						.padding(.horizontal, 16.0)
					}
					Spacer()
				}
				.padding(.horizontal, 12.0)
				
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
