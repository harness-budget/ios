//
//  ContentView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		SpendRingView(goalProgress: Binding.constant(CGFloat(0.50)), spendProgress: Binding.constant(CGFloat(0.20)), fundsRemaining: Binding.constant(30024))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
