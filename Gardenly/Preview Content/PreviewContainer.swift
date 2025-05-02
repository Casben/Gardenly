//
//  PreviewContainer.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    let container = try! ModelContainer(for: Vegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
}()
