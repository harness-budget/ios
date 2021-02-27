//
//  SwiftUIView.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct RingView: View {
    @Binding var progress: CGFloat
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.2), lineWidth: 20)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                ).rotationEffect(.degrees(-90))
        }.frame(alignment: .center)
    }
}

struct SpendRingView: View {
    @Binding var goalProgress: CGFloat
    @Binding var spendProgress: CGFloat
    
    var body: some View {
        ZStack {
            RingView(progress: $goalProgress, color: Color(red: 0.208, green: 0.565, blue: 0.953))
            RingView(progress: $spendProgress, color: Color(red: 0.404, green: 0.929, blue: 0.318))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        SpendRingView(goalProgress: Binding.constant(CGFloat(0.3)), spendProgress: Binding.constant(CGFloat(0.8)))
    }
}
