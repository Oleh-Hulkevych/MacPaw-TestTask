//
//  EquipmentLossesView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct EquipmentLossesView: View {
    
    let equipmentLossesData: [EquipmentLossesModel]
    
    @State private var isScrollMaskVisible = false
    
    init(data equipmentLossesData: [EquipmentLossesModel]) {
        self.equipmentLossesData = equipmentLossesData
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                PageContainerView {
                } content: {
                    ScrollView(showsIndicators: false) {
                        
                        Image("tank.icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .cornerRadius(8.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.4)
                                    .stroke(.black.opacity(0.5), lineWidth: 0.5)
                            )
                            .padding(.top, 30)
                        
                        Text("Втрати обладнання")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        LazyVStack {
                            ForEach(equipmentLossesData, id: \.id) { item in
                                EquipmentLossesCell(item: item)
                            }
                        }
                    }
                    .mask {
                        Rectangle()
                            .overlay(alignment: .top) {
                                ScrollMaskView(isTop: true, height: 30)
                            }
                            .overlay(alignment: .bottom) {
                                ScrollMaskView(isTop: false, height: 30)
                            }
                    }
                    .opacity(isScrollMaskVisible ? 1 : 0)
                    .onAppear {
                        isScrollMaskVisible = true
                    }
                }
            }
            .navigationTitle("Обладнання")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EquipmentLossesView_Previews: PreviewProvider {
    
    @State static var equipmentLossesElements: [EquipmentLossesModel] = [
        EquipmentLossesModel(
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
        )]
    
    static var previews: some View {
        EquipmentLossesView(data: equipmentLossesElements)
    }
}
