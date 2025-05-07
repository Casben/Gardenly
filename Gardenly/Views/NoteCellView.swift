//
//  NoteCellView.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/7/25.
//

import SwiftUI
import SwiftData

struct NoteCellView: View {
    
    let note: Note
    let placeHolderImage: URL?
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 85, height: 85) // Slightly larger than the image
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    
    @Previewable @Query var notes: [Note]
    
    NoteCellView(note: notes[0], placeHolderImage: URL(string: ""))
}
