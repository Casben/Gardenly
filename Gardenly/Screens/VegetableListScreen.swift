//
//  ContentView.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

struct VegetableListScreen: View {
    
    let vegetables: [Vegetable]
    
    var body: some View {
        List(vegetables) { vegetable in
            NavigationLink {
                VegetableDetailScreen(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
           
        }
        .listStyle(.plain)
        .navigationTitle("Vegetables")
    }
}

#Preview {
    NavigationStack {
        VegetableListScreen(vegetables: PreviewData.loadVegetables())
    }
}
