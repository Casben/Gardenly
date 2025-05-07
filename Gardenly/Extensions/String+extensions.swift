//
//  String+extensions.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/7/25.
//

import Foundation


extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
