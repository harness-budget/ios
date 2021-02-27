//
//  ContentView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.orange, lineWidth: 10)
        }.frame(idealWidth: 300, idealHeight: 300, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
