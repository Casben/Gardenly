//
//  PestsListScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/8/25.
//

import SwiftUI

struct PestsListScreen: View {
    let pests: [Pest]
    
    var body: some View {
        List(pests) { pest in
            PestCellView(pest: pest)
        }
        .listStyle(.plain)
        .navigationTitle("Pests")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestsListScreen(pests: PreviewData.loadPests())
    }
    
}
