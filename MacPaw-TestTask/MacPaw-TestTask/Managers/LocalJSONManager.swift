//
//  LocalJSONManager.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import Foundation

enum RussiaLossesJSONDataType {
    case personnelLosses
    case equipmentLosses
    case equipmentLossesCorrection
    case equipmentLossesOryx
    
    var fileName: String {
        switch self {
        case .personnelLosses:
            return "russia_losses_personnel"
        case .equipmentLosses:
            return "russia_losses_equipment"
        case .equipmentLossesCorrection:
            return "russia_losses_equipment_correction"
        case .equipmentLossesOryx:
            return "russia_losses_equipment_oryx"
        }
    }
}

actor LocalJSONManager {

    func loadPersonnelLossesJSONData() async throws -> [PersonnelLossesModel] {
        return decode([PersonnelLossesModel].self, from: .personnelLosses)
    }
    
    func loadEquipmentLossesJSONData() async throws -> [EquipmentLossesModel] {
        return decode([EquipmentLossesModel].self, from: .equipmentLosses)
    }
    
    func loadEquipmentLossesCorrectionJSONData() async throws -> [EquipmentLossesCorrectionModel] {
        return decode([EquipmentLossesCorrectionModel].self, from: .equipmentLossesCorrection)
    }
    
    func loadEquipmentLossesOryxJSONData() async throws -> [EquipmentLossesOryxModel] {
        return decode([EquipmentLossesOryxModel].self, from: .equipmentLossesOryx)
    }
    
    private func decode<T: Decodable>(_ type: T.Type, from dataType: RussiaLossesJSONDataType) -> T {
        guard let url = Bundle.main.url(forResource: dataType.fileName, withExtension: "json") else {
            fatalError("📕: Failed to locate \(dataType.fileName) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("📕: Failed to load \(dataType.fileName) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            print(error)
            fatalError("📕: Failed to decode \(dataType.fileName) from bundle.")
        }
    }
}
