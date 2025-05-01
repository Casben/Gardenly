//
//  PreviewData.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import Foundation

struct PreviewData {
    static func loadVegetables() -> [Vegetable] {
        guard let url = Bundle.main.url(forResource: "Vegetables", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return vegetables
        } catch {
            return []
        }
    }
}
