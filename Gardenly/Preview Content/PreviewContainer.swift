//
//  PreviewContainer.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    let container = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    let vegetables = PreviewData.loadVegetables().prefix(5)
    
    for vegetable in vegetables {
        container.mainContext.insert(vegetable)
    }
    
    for vegetable in vegetables {
        let myGardenVegetable = MyGardenVegetable(vegetable: vegetable, plantOption: .seed)
        container.mainContext.insert(myGardenVegetable)
    }
    
    return container
}()
