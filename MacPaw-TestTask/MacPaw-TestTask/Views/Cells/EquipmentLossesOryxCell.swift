//
//  EquipmentLossesOryxCell.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct EquipmentLossesOryxCell: View {
    
    let equipmentLossesOryxItem: EquipmentLossesOryxModel
    
    init(item equipmentLossesOryxItem: EquipmentLossesOryxModel) {
        self.equipmentLossesOryxItem = equipmentLossesOryxItem
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    Text("Вид обладнання: \(equipmentLossesOryxItem.equipmentOryx)")
                    Text("Модель: \(equipmentLossesOryxItem.model)")
                    Text("Виробник: \(equipmentLossesOryxItem.manufacturer)")
                    Text("Кількість втрат: \(equipmentLossesOryxItem.lossesTotal)")
                    Text("Знешкодженно за допомогою: \(equipmentLossesOryxItem.equipmentUa)")
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

struct EquipmentLossesOryxCell_Previews: PreviewProvider {
    
    @State static var equipmentLossesOryxItem: EquipmentLossesOryxModel = EquipmentLossesOryxModel(equipmentOryx: "Tanks", model: "T-62 Obr. 1967", manufacturer: "the Soviet Union", lossesTotal: 1, equipmentUa: "Tanks")
    
    static var previews: some View {
        EquipmentLossesOryxCell(item: equipmentLossesOryxItem)
    }
}
