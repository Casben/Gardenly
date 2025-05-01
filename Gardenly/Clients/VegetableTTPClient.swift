//
//  VegetableTTPClient.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import Foundation

struct VegetableTTPClient {
    
    func fetchVegetable() async throws -> [Vegetable] {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://azamsharp.com/vegetables.json")!)
        
        return try JSONDecoder().decode([Vegetable].self, from: data)
    }
}
