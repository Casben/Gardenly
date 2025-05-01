//
//  Vegetable.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import Foundation
import SwiftData

@Model
class Vegetable: Decodable {
    var vegetableId: Int
    var vegetableCode: String
    var name: String
    var body: String
    var thumbnailImage: URL
    var seedDepth: String
    var germinationSoilTemp: String
    var daysToGermination: Int
    var sowIndoors: String
    var sowOutdoors: String
    var phRange: String
    var growingSoilTemp: String
    var spacingBeds: String
    var watering: String
    var light: String
    var goodCompanions: String
    var badCompanions: String
    var sowingDescription: String?
    var growingDescription: String
    var harvestDescription: String
    var active: Bool?
    var session: String
    var daysToHarvestSeeds: Int
    var daysToHarvestSeedlings: Int
    var healthBenefits: String
}
