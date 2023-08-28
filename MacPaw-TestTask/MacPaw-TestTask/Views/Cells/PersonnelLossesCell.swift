//
//  PersonnelLossesCell.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct PersonnelLossesCell: View {
    
    let personnelLossesItem: PersonnelLossesModel
    
    init(item personnelLossesItem: PersonnelLossesModel) {
        self.personnelLossesItem = personnelLossesItem
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Дата: \(personnelLossesItem.date.formatedToFullDate) / Дань: \(personnelLossesItem.day)")
                Text("Втрати ворога: \(personnelLossesItem.personnel) солдат.")
                
                if let prisoners = personnelLossesItem.pow {
                    Text("Взято в полон: \(prisoners) окупантів.")
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

struct PersonnelLossesCell_Previews: PreviewProvider {
    
    @State static var personnelLossesItem: PersonnelLossesModel = PersonnelLossesModel(date: "2022-02-25", day: 2, personnel: 2800, personnelLossesModelPersonnel: "about", pow: 0)
    
    static var previews: some View {
        PersonnelLossesCell(item: personnelLossesItem)
    }
}
