//
//  EquipmentLossesCell.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct EquipmentLossesCell: View {
    
    let equipmentLossesItem: EquipmentLossesModel
    
    init(item equipmentLossesItem: EquipmentLossesModel) {
        self.equipmentLossesItem = equipmentLossesItem
    }
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    Text("Дата: \(equipmentLossesItem.date.formatedToFullDate) / День: \(equipmentLossesItem.day)")
                    Text("Знешкоджено:")
                    Text("Літаків: \(equipmentLossesItem.aircraft)")
                    Text("Гелікоптерів: \(equipmentLossesItem.helicopter)")
                    Text("Танків: \(equipmentLossesItem.tank)")
                    Text("APC: \(equipmentLossesItem.apc)")
                    Text("Польової артилерії: \(equipmentLossesItem.fieldArtillery)")
                    Text("Реактивних систем залпового вогню: \(equipmentLossesItem.mrl)")
                    Text("Військових автівок: \(equipmentLossesItem.militaryAuto ?? 0)")
                }
                
                Group {
                    Text("Паливних баків: \(equipmentLossesItem.fuelTank ?? 0)")
                    Text("Дронів: \(equipmentLossesItem.drone)")
                    Text("Військово-морських кораблів: \(equipmentLossesItem.navalShip)")
                    Text("Протиповітряної оборони: \(equipmentLossesItem.antiAircraftWarfare)")
                    Text("Спецобладнання: \(equipmentLossesItem.specialEquipment ?? 0)")
                    Text("Мобільних систем RBM: \(equipmentLossesItem.mobileSRBMSystem ?? 0)")
                    Text("Напрямок найбільших втрат: \(equipmentLossesItem.greatestLossesDirection ?? "немає")")
                    Text("Транспортні засоби та паливні баки: \(equipmentLossesItem.vehiclesAndFuelTanks ?? 0)")
                    Text("Крилаті ракети: \(equipmentLossesItem.cruiseMissiles ?? 0)")
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

struct EquipmentLossesCell_Previews: PreviewProvider {
    
    @State static var equipmentLossesItem: EquipmentLossesModel = EquipmentLossesModel(
        date: "2022-02-25",
        day: 2,
        aircraft: 10,
        helicopter: 7,
        tank: 80,
        apc: 516,
        fieldArtillery: 49,
        mrl: 4,
        militaryAuto: 100,
        fuelTank: 60,
        drone: 0,
        navalShip: 2,
        antiAircraftWarfare: 0,
        
        specialEquipment: 5,
        mobileSRBMSystem: 33,
        greatestLossesDirection: "багато",
        vehiclesAndFuelTanks: 56,
        cruiseMissiles: 14
    )
    
    static var previews: some View {
        EquipmentLossesCell(item: equipmentLossesItem)
    }
}
