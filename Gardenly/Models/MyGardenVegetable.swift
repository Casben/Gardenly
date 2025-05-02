//
//  MyGardenVegetable.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import Foundation
import SwiftData

@Model
class MyGardenVegetable {
    
    var vegetable: Vegetable
    var plantOption: PlantOption
    var datePlanted: Date = Date()
    
    init(vegetable: Vegetable, plantOption: PlantOption, datePlanted: Date) {
        self.vegetable = vegetable
        self.plantOption = plantOption
        self.datePlanted = datePlanted
    }
}
