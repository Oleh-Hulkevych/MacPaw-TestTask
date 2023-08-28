//
//  EquipmentLossesCorrectionModel.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import Foundation

struct EquipmentLossesCorrectionModel: Identifiable, Decodable {
    let id = UUID()
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let apc: Int
    let fieldArtillery: Int
    let mrl: Int
    let drone: Int
    let navalShip: Int
    let antiAircraftWarfare: Int
    let specialEquipment: Int
    let vehiclesAndFuelTanks: Int
    let cruiseMissiles: Int

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}
