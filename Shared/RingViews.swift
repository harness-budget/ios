//
//  RingViews.swift
//  Harness
//
//  Created by Ben Aubin on 2/27/21.
//

import SwiftUI

struct RingView: View {
    @Binding var progress: CGFloat
	var strokeWidth: CGFloat = 26
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.2), lineWidth: strokeWidth)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round)
                ).rotationEffect(.degrees(-90))
		}.frame(alignment: .center)
    }
}

struct SpendRingView: View {
    @Binding var goalProgress: CGFloat
    @Binding var spendProgress: CGFloat
	@Binding var fundsRemaining: Int
    
    var body: some View {
        ZStack {
            RingView(progress: $goalProgress, color: Color(red: 0.208, green: 0.565, blue: 0.953)).frame(width: 220.0, height: 220.0)
			RingView(progress: $spendProgress, color: Color(red: 0.404, green: 0.929, blue: 0.318)).frame(width: 156.0, height: 156.0)
			VStack {
				HStack(alignment: .bottom, spacing: 0.0) {
					Text(fundsRemaining < 1_000_00 ? "$\(fundsRemaining / 100)" : "$\(fundsRemaining / 100_000)k")
						.font(.largeTitle)
						.fontWeight(.semibold)
						.scaledToFill()
						.minimumScaleFactor(0.5)
					if (fundsRemaining < 10000) {
						Text(".\(fundsRemaining % 100)")
					}
				}
				.frame(width: 100.0)
				Text("to spend")
			}
        }
    }
}

struct GoalRingView: View {
	@Binding var goalProgress: CGFloat
	@Binding var goalValue: Int
	
	var body: some View {
		ZStack {
			RingView(progress: $goalProgress, strokeWidth: 12, color: Color(red: 0.208, green: 0.565, blue: 0.953))
				.frame(width: 64.0, height: 64.0)
			HStack(alignment: .bottom, spacing: 0.0) {
				Text(goalValue < 1_000_00 ? "$\(goalValue / 100)" : "$\(goalValue / 100_000)k")
					.font(.body)
					.fontWeight(.semibold)
					.scaledToFill()
					.minimumScaleFactor(0.5)
			}
			.frame(width: 45.0)
		}.frame(width: 64.0, height: 64.0)
	}
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
		SpendRingView(goalProgress: Binding.constant(CGFloat(0.3)), spendProgress: Binding.constant(CGFloat(0.8)), fundsRemaining: Binding.constant(10000024))
		GoalRingView(goalProgress: Binding.constant(CGFloat(0.3)), goalValue: Binding.constant(300_00))
    }
}
