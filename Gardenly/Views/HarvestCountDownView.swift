//
//  HarvestCountDownView.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/2/25.
//

import SwiftUI

struct HarvestCountDownView: View {
    
    let plantingDate: Date
    let harvestingDays: Int
    
    private var daysElapsed: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: plantingDate, to: Date())
        return max(components.day ?? 0, 0)
    }
    
    private var daysRemaining: Int {
        max(harvestingDays - daysElapsed, 0)
    }
    
    private var progress: CGFloat {
        CGFloat(daysElapsed) / CGFloat(harvestingDays)
    }
    
    var body: some View {
        ZStack {
            // background circle
            Circle()
                .stroke(
                    Color.green.opacity(0.2),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
            //progress circle
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.green,
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            VStack(spacing: 2) {
                Text("\(daysRemaining)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text("Days")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 60, height: 60)
        .padding()
    }
}

#Preview {
    HarvestCountDownView(plantingDate: Date().daysAgo(30), harvestingDays: 90)
}
