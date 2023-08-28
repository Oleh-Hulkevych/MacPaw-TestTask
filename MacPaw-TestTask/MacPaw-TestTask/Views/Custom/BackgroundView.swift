//
//  BackgroundView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        ZStack {
            Image("background.picture")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .blur(radius: 40)
                .opacity(0.7)
            Color.blue.opacity(0.2)
        }
        .ignoresSafeArea(.all)
    }
}

struct HolidaysViewBackground_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
