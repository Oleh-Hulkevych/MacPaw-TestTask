//
//  ScrollMaskView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct ScrollMaskView: View {
    
    let isTop: Bool
    let height: CGFloat
    
    var body: some View {
        LinearGradient(colors: [.black, .clear], startPoint: UnitPoint(x: 0.5, y: isTop ? 0 : 1), endPoint: UnitPoint(x: 0.5, y: isTop ? 1 : 0))
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .blendMode(.destinationOut)
    }
}

struct ScrollMaskView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMaskView(isTop: true, height: 50)
    }
}
