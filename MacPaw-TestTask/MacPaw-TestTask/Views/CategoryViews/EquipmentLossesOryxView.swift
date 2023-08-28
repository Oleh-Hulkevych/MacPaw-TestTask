//
//  EquipmentLossesOryxView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct EquipmentLossesOryxView: View {
    
    let equipmentLossesOryxData: [EquipmentLossesOryxModel]
    
    @State private var isScrollMaskVisible = false
    
    init(data equipmentLossesOryxData: [EquipmentLossesOryxModel]) {
        self.equipmentLossesOryxData = equipmentLossesOryxData
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                PageContainerView {
                } content: {
                    ScrollView(showsIndicators: false) {
                        
                        Image("oryx.logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .cornerRadius(8.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.4)
                                    .stroke(.black.opacity(0.5), lineWidth: 0.5)
                            )
                            .padding(.top, 30)
                        
                        Text("Більш детальніші дані про втрати обладнання під час війни на основі Oryx")
                            .font(.system(size: 17.5))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        LazyVStack {
                            ForEach(equipmentLossesOryxData, id: \.id) { item in
                                EquipmentLossesOryxCell(item: item)
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
            .navigationTitle("Детальніше від Oryx")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EquipmentLossesOryxView_Previews: PreviewProvider {
    
    @State static var equipmentLossesOryxElements: [EquipmentLossesOryxModel] = [EquipmentLossesOryxModel(equipmentOryx: "Tanks", model: "T-62 Obr. 1967", manufacturer: "the Soviet Union", lossesTotal: 1, equipmentUa: "Tanks")]
    
    static var previews: some View {
        EquipmentLossesOryxView(data: equipmentLossesOryxElements)
    }
}
