//
//  AddGoalView.swift
//  Harness
//
//  Created by Andrew Carter on 2/28/21.
//

import Foundation
import SwiftUI


struct AddGoalView: View {
    
    
    @Binding var safeToSpend: Int
    @State private var name: String = ""
    @State private var amount: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("What are you setting aside for?")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Name", text: $name)
                
                
                Spacer()
                HStack{
                    Spacer()
                    MoneyInputView(value: $amount)
                    Spacer()
                }
                Spacer()
                Button (action: {}, label: {
                    HStack {
                        Spacer()
                        Text("Set Aside")
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
            .navigationTitle("Set Aside")
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView(safeToSpend: Binding.constant(75000))
    }
}
