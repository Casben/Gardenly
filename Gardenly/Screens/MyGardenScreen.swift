//
//  MyGardenScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/2/25.
//

import SwiftUI
import SwiftData

struct MyGardenScreen: View {
    @Query private var myGardenVegetables: [MyGardenVegetable]
    @Environment(\.modelContext) private var context
    
    private func deleteMyGardenVegetable(at offsets: IndexSet) {
        offsets.forEach { index in
            let myGardenVegetables = myGardenVegetables[index]
            context.delete(myGardenVegetables)
        }
    }
    var body: some View {
        List {
            ForEach(myGardenVegetables) { myGardenVegetable in
                NavigationLink {
                    NoteListScreen(myGardenVegetable: myGardenVegetable)
                } label: {
                    MyGardenCellView(myGardenVegetable: myGardenVegetable)
                }

            }
            .onDelete(perform: deleteMyGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        MyGardenScreen()
    }
}
