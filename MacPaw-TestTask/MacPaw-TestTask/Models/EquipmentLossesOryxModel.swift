//
//  EquipmentLossesOryxModel.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import Foundation

struct EquipmentLossesOryxModel: Identifiable, Decodable {
    let id = UUID()
    let equipmentOryx: String
    let model: String
    let manufacturer: String
    let lossesTotal: Int
    let equipmentUa: String

    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model
        case manufacturer
        case lossesTotal = "losses_total"
        case equipmentUa = "equipment_ua"
    }
}
