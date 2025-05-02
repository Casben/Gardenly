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
    
    var body: some View {
        List(myGardenVegetables) { myGardenVegetable in
            Text(myGardenVegetable.vegetable.name)
        }
    }
}

#Preview {
    NavigationStack {
        MyGardenScreen()
    }
    .modelContainer(previewContainer)
    
}
