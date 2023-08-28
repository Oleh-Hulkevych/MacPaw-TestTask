//
//  EquipmentLossesCorrectionView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct EquipmentLossesCorrectionView: View {
    
    let equipmentLossesCorrectionData: [EquipmentLossesCorrectionModel]
    
    @State private var isScrollMaskVisible = false
    
    init(data equipmentLossesCorrectionData: [EquipmentLossesCorrectionModel]) {
        self.equipmentLossesCorrectionData = equipmentLossesCorrectionData
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                PageContainerView {
                } content: {
                    ScrollView(showsIndicators: false) {
                        
                        Image("tankist.icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .cornerRadius(8.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.4)
                                    .stroke(.black.opacity(0.5), lineWidth: 0.5)
                            )
                            .padding(.top, 30)
                        
                        Text("Дані про втрати обладнання")
                            .font(.system(size: 17.5))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                        
                        Text("(з 13 жовтня 2022 по 27 травня 2023)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        LazyVStack {
                            ForEach(equipmentLossesCorrectionData, id: \.id) { item in
                                EquipmentLossesCorrectionCell(item: item)
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
            .navigationTitle("Обладнання за період")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EquipmentLossesCorrectionView_Previews: PreviewProvider {
    
    @State static var equipmentLossesCorrectionElements: [EquipmentLossesCorrectionModel] = [EquipmentLossesCorrectionModel(date: "2022-10-13", day: 231, aircraft: 0, helicopter: 0, tank: 0, apc: -25, fieldArtillery: 32, mrl: 0, drone: 20, navalShip: 1, antiAircraftWarfare: 0, specialEquipment: 0, vehiclesAndFuelTanks: 0, cruiseMissiles: 0
                                                                                                                           )]
    
    static var previews: some View {
        EquipmentLossesCorrectionView(data: equipmentLossesCorrectionElements)
    }
}
