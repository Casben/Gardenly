//
//  GardenlyApp.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

@main
struct GardenlyApp: App {
    var body: some Scene {
        WindowGroup {
            VegetableTabBarScreen()
                .modelContainer(for: [Vegetable.self, MyGardenVegetable.self, Note.self])
        }
    }
}
