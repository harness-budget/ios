//
//  ContentView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI
import KeychainAccess

struct DashboardView: View {
    var network: Network
    
    @State var data: DashboardQuery.Data?
    
	var body: some View {
		NavigationView {
            
            if let data = self.data {
                VStack{
                    SpendRingView(
                        goalProgress: Binding(get: { CGFloat(data.currentUser!.goalMetFraction)},set: {_,_ in }),
                        spendProgress: Binding(get: { CGFloat(data.currentUser!.safeToSpendFraction)},set: {_,_ in }),
                        fundsRemaining: Binding(
                            get: { data.currentUser!.safeToSpend.fractional },
                            set: {_,_ in }
                        )
                    ).padding(.top, 36.0)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Set aside")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 12.0)
                                ScrollView(.horizontal) {
                                    HStack(alignment: .top){
                                        ForEach(data.currentUser!.envelopes, id: \.id) { (envelope) in
                                            GoalRingView(goalProgress:  Binding(get: {
                                                let goal = (envelope.goalFractional ?? 0);
                                                if goal == 0 {
                                                    return CGFloat(1)
                                                } else {
                                                    return CGFloat((envelope.balanceFractional ?? 0) / goal)
                                                }
                                            }, set: {_,_ in }), goalValue: Binding(get: {
                                                (envelope.balanceFractional ?? 0)
                                            }, set: {_,_ in }), goalName: Binding(get: {
                                                envelope.name ?? ""
                                            }, set: {_,_ in }))
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .navigationTitle("Your Spending")
                    .navigationBarItems(trailing:
                        HStack() {
                        
                        Button("Logout") {
							do {
								try Keychain(server: "https://harnessbudget.com", protocolType: .https)
									.accessibility(.whenUnlocked)
									.remove("harness-budget-token")
								print("removed keychain item")
							} catch let error {
								print("error: \(error)")
							}
                        }
                        
                        Button(action: {
                            print("Settings tapped!")
                        }) {
                            Image(systemName: "gear")
                        }
                    })
            } else {
                ProgressView()
            }
        }.onAppear(perform: {
            network.apollo.fetch(query: DashboardQuery(), resultHandler: { res in
                do {
                    self.data = try res.get().data!
                } catch let err {
                    print(err)
                }
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        DashboardView(network: Network())
	}
}
