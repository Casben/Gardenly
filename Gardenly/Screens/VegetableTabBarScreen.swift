//
//  VegetableTabBarScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    
    @State private var vegetables: [Vegetable] = []
    
    private var pests: [Pest] {
            
            let allPests = vegetables.flatMap { $0.pests ?? [] }
            
            return Array(Set(allPests.map { $0.name.lowercased() }))
                .compactMap { name in
                    allPests.first { $0.name.lowercased() == name }
            }
            
        }
    
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
                PestsListScreen(pests: pests)
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
