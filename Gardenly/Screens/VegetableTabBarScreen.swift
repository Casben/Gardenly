//
//  VegetableTabBarScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen()
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
    }
}

#Preview {
    VegetableTabBarScreen()
        .modelContainer(previewContainer)
}
