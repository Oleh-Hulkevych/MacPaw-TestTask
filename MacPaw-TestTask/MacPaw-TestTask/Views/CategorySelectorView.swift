//
//  CategorySelectorView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//


import SwiftUI

enum CategoryType: String, CaseIterable {
    case personnelLosses
    case equipmentLosses
    case equipmentLossesCorrection
    case equipmentLossesOryx
}

struct CategorySelectorView: View {
    
    @Binding var selectedCategory: CategoryType?
    @Binding var showCategory: Bool
    
    private let columns = [GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        
        LazyVGrid(columns: columns, alignment: .center, spacing: 10, pinnedViews: []) {
            ForEach(CategoryType.allCases, id: \.self) { category in
                Button {
                    selectedCategory = category
                    showCategory.toggle()
                } label: {
                    buttonView(
                        image: getImage(for: category),
                        title: getTitle(for: category)
                    )
                }
            }
        }
        .padding(.horizontal, 10)
    }
    
    private func getTitle(for category: CategoryType) -> String {
        switch category {
        case .personnelLosses: return "Втрати особового складу"
        case .equipmentLosses: return "Втрати обладнання"
        case .equipmentLossesCorrection: return "Дані про втрати обладнання (з 13 жовтня 2022 по 27 травня 2023)"
        case .equipmentLossesOryx: return "Більш детальніші дані про втрати обладнання під час війни на основі Oryx"
        }
    }
    
    private func getImage(for category: CategoryType) -> String {
        switch category {
        case .personnelLosses: return "soldier.icon"
        case .equipmentLosses: return "tank.icon"
        case .equipmentLossesCorrection: return "tankist.icon"
        case .equipmentLossesOryx: return "oryx.logo"
        }
    }
    
    private func buttonView(image: String, title: String) -> some View {
        HStack(spacing: 0) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8.4)
                .padding([.leading, .vertical], 5)
                .padding(.trailing, 10)
            
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .padding(.leading, 10)
                .padding(.trailing, 15)
        }
        .frame(height: 70)
        .background(.blue.opacity(0.65))
        .cornerRadius(11.25)
    }
}

struct CategorySelectorView_Previews: PreviewProvider {
    
    @State static var selectedCategory: CategoryType?
    @State static var showCategory: Bool = false
    
    static var previews: some View {
        CategorySelectorView(selectedCategory: $selectedCategory, showCategory: $showCategory)
    }
}
