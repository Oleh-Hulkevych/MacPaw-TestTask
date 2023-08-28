//
//  HomeView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var selectedCategory: CategoryType?
    @State private var showCategory: Bool = false
    @State private var isScrollMaskVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                PageContainerView {
                    Image("mac.paw.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 27.5)
                        .padding(.vertical, 7.5)

                    VStack {
                        Image("fuck.russian.ship")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(11.25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11.25)
                                    .stroke(.black.opacity(0.5), lineWidth: 0.5)
                            )
                            .padding(.all, 10)
                    }
                    .background(.white.opacity(0.75))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black.opacity(0.5), lineWidth: 0.5)
                    )
                    .padding([.top, .horizontal], 10)
                    
                } content: {
                    ScrollView(showsIndicators: false) {
                        CategorySelectorView(selectedCategory: $selectedCategory, showCategory: $showCategory)
                            .padding(.top, 10)
                            .navigationDestination(isPresented: $showCategory) {
                                if let selectedCategory = selectedCategory {
                                    showSelectedCategory(selectedCategory)
                                }
                            }
                        
                        VStack {
                            Text("Developed by:")
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("Oleh Hulkevych")
                                .font(.system(size: 17, weight: .medium))
                        }
                        .foregroundColor(.secondary)
                        .padding(.vertical, 20)
                    }
                    .mask {
                        Rectangle()
                            .overlay(alignment: .top) {
                                ScrollMaskView(isTop: true, height: 10)
                            }
                            .overlay(alignment: .bottom) {
                                ScrollMaskView(isTop: false, height: 20)
                            }
                    }
                    .opacity(isScrollMaskVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: isScrollMaskVisible)
                    .onAppear {
                        isScrollMaskVisible = true
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func showSelectedCategory(_ category: CategoryType) -> some View {
        switch category {
        case .personnelLosses:
            PersonnelLossesView(data: viewModel.personnelLosses)
        case .equipmentLosses:
            EquipmentLossesView(data: viewModel.equipmentLosses)
        case .equipmentLossesCorrection:
            EquipmentLossesCorrectionView(data: viewModel.equipmentLossesCorrection)
        case .equipmentLossesOryx:
            EquipmentLossesOryxView(data: viewModel.equipmentLossesOryx)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
