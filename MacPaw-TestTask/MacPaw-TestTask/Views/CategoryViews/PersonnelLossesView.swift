//
//  PersonnelLossesView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct PersonnelLossesView: View {
    
    let personnelLossesData: [PersonnelLossesModel]
    
    @State private var isScrollMaskVisible = false
    
    init(data personnelLossesData: [PersonnelLossesModel]) {
        self.personnelLossesData = personnelLossesData
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                PageContainerView {
                } content: {
                    ScrollView(showsIndicators: false) {
                        
                        Image("soldier.icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .cornerRadius(8.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.4)
                                    .stroke(.black.opacity(0.5), lineWidth: 0.5)
                            )
                            .padding(.top, 30)
                        
                        Text("Втрати особового складу")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        LazyVStack {
                            ForEach(personnelLossesData, id: \.id) { item in
                                PersonnelLossesCell(item: item)
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
            .navigationTitle("Особовий склад")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PersonnelLossesView_Previews: PreviewProvider {
    
    @State static var personnelLossesElements: [PersonnelLossesModel] = [PersonnelLossesModel(date: "2022-02-25", day: 2, personnel: 2800, personnelLossesModelPersonnel: "about", pow: 0)]
    
    static var previews: some View {
        PersonnelLossesView(data: personnelLossesElements)
    }
}
