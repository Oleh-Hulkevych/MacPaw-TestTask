//
//  PageContainerView.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 28.08.2023.
//

import SwiftUI

struct PageContainerView<Header: View, Content: View>: View {
    
    let header: Header
    let content: Content
    
    init(@ViewBuilder header: () -> Header, @ViewBuilder content: () -> Content) {
        self.header = header()
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header
            VStack {
                content
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        .white.opacity(0),
                        .white.opacity(0.75)
                    ]),
                    startPoint: .bottom,
                    endPoint: .top)
            )
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Gradient(colors: [
                        .black.opacity(0.3),
                        .black.opacity(0.1),
                        .black.opacity(0.0)
                    ]), lineWidth: 1)
            )
            .padding(.all, 10)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    .white.opacity(0),
                    .white.opacity(0.75)
                ]),
                startPoint: .top,
                endPoint: .bottom))
        
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Gradient(colors: [
                    .black.opacity(0.0),
                    .black.opacity(0.1),
                    .black.opacity(0.3)
                ]), lineWidth: 1)
        )
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}

struct PageContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PageContainerView {
            Text("Header")
                .font(.largeTitle)
                .foregroundColor(.white)
        } content: {
            Text("Content")
                .font(.title)
                .foregroundColor(.white)
        }
        .background(Color.blue.opacity(0.5))
    }
}
