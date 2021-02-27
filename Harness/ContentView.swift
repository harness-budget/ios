//
//  ContentView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct ContentView: View {
    @State var isGoalsExpanded = true
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                SpendRingView(goalProgress: .constant(0.65), spendProgress: .constant(0.75), includeDollars: true)
                    .frame(width: 300, height: 300, alignment: .center)
                DisclosureGroup(
                    isExpanded: $isGoalsExpanded,
                    content: { ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 5) { item in
                                VStack {
                                    SpendRingView(goalProgress: .constant(0.2), spendProgress: .constant(0.45))
                                        .padding()
                                        .frame(width: 100, height: 100, alignment: .center)
                                    Text("Hello")
                                }
                            }
                    } }},
                    label: { Text("Goals") }
                )
                Spacer()
            }
            .padding()
            .navigationTitle("My Spending")
            .navigationBarItems(trailing: Button(action: {}, label: {
                Image(systemName: "gear")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
