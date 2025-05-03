//
//  Date+extensions.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/3/25.
//

import Foundation

extension Date {
    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }
}
