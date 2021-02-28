//
//  MoneyInputView.swift
//  Harness
//
//  Created by Andrew Carter on 2/28/21.
//

import Foundation
import SwiftUI


struct MoneyInputView: View {
    
    @Binding var value: Int
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    func addNumber(number: Int) {
        value *= 10
        value += number
    }
    
    func dropNumber() {
        value /= 10
    }
    
    func clear() {
        value = 0
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("$\(value / 100).\(String(format: "%02d", value % 100))")
                    .font(.title)
                    .fontWeight(.bold)
            }
            LazyVGrid(columns: gridItemLayout) {
                ForEach((1...9), id: \.self) { i in
                    Button (action: {addNumber(number: i)}, label: {
                        HStack {
                            Spacer()
                            Text("\(i)")
                                .font(.title)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }).padding()
                }
            }
            HStack() {
                
                Button (action: {clear()}, label: {
                    HStack {
                        Spacer()
                        Image(systemName: "clear")
                        Spacer()
                    }
                }).padding()
                
                Button (action: {addNumber(number: 0)}, label: {
                    HStack {
                        Spacer()
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }).padding()
                
                Button (action: {dropNumber()}, label: {
                    HStack {
                        Spacer()
                        Image(systemName: "delete.left")
                        Spacer()
                    }
                }).padding()
                
                
            }
        }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct MoneyInputView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInputView(value: Binding.constant(50025))
    }
}
