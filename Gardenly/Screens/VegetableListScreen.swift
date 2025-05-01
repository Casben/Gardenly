//
//  ContentView.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

struct VegetableListScreen: View {
    @State private var vegetables: [Vegetable] = []
    var body: some View {
        List(vegetables) { vegetable in
            VegetableCellView(vegetable: vegetable)
        }
        .listStyle(.plain)
        .task {
            do {
                let client = VegetableTTPClient()
                vegetables = try await client.fetchVegetable()
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .navigationTitle("Vegetables")
//        .padding()
    }
}

#Preview {
    NavigationStack {
        VegetableListScreen()
    }
}
