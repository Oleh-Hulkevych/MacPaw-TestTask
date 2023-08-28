//
//  EquipmentLossesCorrection.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct EquipmentLossesCorrectionCell: View {
    
    let equipmentLossesCorrectionItem: EquipmentLossesCorrectionModel
    
    init(item equipmentLossesCorrectionItem: EquipmentLossesCorrectionModel) {
        self.equipmentLossesCorrectionItem = equipmentLossesCorrectionItem
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    Text("Дата: \(equipmentLossesCorrectionItem.date.formatedToFullDate) / Дань: \(equipmentLossesCorrectionItem.day)")
                    Text("Знешкоджено:")
                    Text("Літаків: \(equipmentLossesCorrectionItem.aircraft)")
                    Text("Гелікоптерів: \(equipmentLossesCorrectionItem.helicopter)")
                    Text("Танків: \(equipmentLossesCorrectionItem.tank)")
                    Text("APC: \(equipmentLossesCorrectionItem.apc)")
                    Text("Польової артилерії: \(equipmentLossesCorrectionItem.fieldArtillery)")
                    Text("Реактивних систем залпового вогню: \(equipmentLossesCorrectionItem.mrl)")
                    Text("Дронів: \(equipmentLossesCorrectionItem.drone)")
                    Text("Військово-морських кораблів: \(equipmentLossesCorrectionItem.navalShip)")
                }
                
                Group {
                    Text("Протиповітряної оборони: \(equipmentLossesCorrectionItem.antiAircraftWarfare)")
                    Text("Cпецобладнання: \(equipmentLossesCorrectionItem.specialEquipment)")
                    Text("Транспортних засобів та паливних баків: \(equipmentLossesCorrectionItem.vehiclesAndFuelTanks)")
                    Text("Крилатих ракет: \(equipmentLossesCorrectionItem.cruiseMissiles)")
                }
            }
            .font(.system(size: 17, weight: .regular))
            Spacer()
        }
        .padding(.all, 15)
        .background(.blue.opacity(0.2))
        .cornerRadius(11.25)
        .padding([.top, .horizontal], 10)
    }
}

struct EquipmentLossesCorrection_Previews: PreviewProvider {
    
    @State static var equipmentLossesCorrectionItem: EquipmentLossesCorrectionModel = EquipmentLossesCorrectionModel(date: "2022-10-13", day: 231, aircraft: 0, helicopter: 0, tank: 0, apc: -25, fieldArtillery: 32, mrl: 0, drone: 20, navalShip: 1, antiAircraftWarfare: 0, specialEquipment: 0, vehiclesAndFuelTanks: 0, cruiseMissiles: 0)
    
    static var previews: some View {
        EquipmentLossesCorrectionCell(item: equipmentLossesCorrectionItem)
    }
}
