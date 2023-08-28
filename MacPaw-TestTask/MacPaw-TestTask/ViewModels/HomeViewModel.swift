//
//  HomeViewModel.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import Foundation

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    private let dataManager: LocalJSONManager
    
    @Published var personnelLosses: [PersonnelLossesModel] = []
    @Published var equipmentLosses: [EquipmentLossesModel] = []
    @Published var equipmentLossesCorrection: [EquipmentLossesCorrectionModel] = []
    @Published var equipmentLossesOryx: [EquipmentLossesOryxModel] = []
    
    init(dataManager: LocalJSONManager) {
        self.dataManager = dataManager
        fetchData()
    }
    
    private func fetchData() {
        let startTime = Date()

        fetchPersonnelLossesData()
        fetchEquipmentLossesData()
        fetchEquipmentLossesCorrectionData()
        fetchEquipmentLossesOryxData()

        let endTime = Date()
        let executionTime = endTime.timeIntervalSince(startTime)
        print("📗: fetchData() completed in \(executionTime) seconds! 🙃")
    }

    private func fetchPersonnelLossesData() {
        Task {
            do {
                personnelLosses = try await dataManager.loadPersonnelLossesJSONData()
            } catch {
                print("📕: Error fetching Personnel Losses!")
            }
        }
    }
    
    private func fetchEquipmentLossesData() {
        Task {
            do {
                equipmentLosses = try await dataManager.loadEquipmentLossesJSONData()
            } catch {
                print("📕: Error fetching Equipment Losses!")
            }
        }
    }
    
    private func fetchEquipmentLossesCorrectionData() {
        Task {
            do {
                equipmentLossesCorrection = try await dataManager.loadEquipmentLossesCorrectionJSONData()
            } catch {
                print("📕: Error fetching Equipment Losses!")
            }
        }
    }
    
    private func fetchEquipmentLossesOryxData() {
        Task {
            do {
                equipmentLossesOryx = try await dataManager.loadEquipmentLossesOryxJSONData()
            } catch {
                print("📕: Error fetching Equipment Losses!")
            }
        }
    }
}
