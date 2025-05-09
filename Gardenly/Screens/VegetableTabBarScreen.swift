//
//  VegetableTabBarScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    
    @State private var vegetables: [Vegetable] = []
    
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen(vegetables: vegetables)
            }
            .tabItem {
                Image(systemName: "leaf")
                Text("Vegetables")
            }
            
            NavigationStack {
                MyGardenScreen()
            }
            .tabItem {
                Image(systemName: "house")
                Text("My Garden")
            }
            
            NavigationStack {
                Text("Pests")
            }
            .tabItem {
                Image(systemName: "ladybug")
                Text("Pests")
            }
        }
        .task {
            do {
                let client = VegetableTTPClient()
                vegetables = try await client.fetchVegetable()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
        .modelContainer(previewContainer)
}
