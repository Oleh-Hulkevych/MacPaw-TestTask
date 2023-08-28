//
//  MacPaw_TestTaskApp.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import SwiftUI

@main
struct MacPaw_TestTaskApp: App {
    
    private let localJSONManager = LocalJSONManager()
    
    var body: some Scene {
        
        let homeViewModel = HomeViewModel(dataManager: localJSONManager)
        
        WindowGroup {
            HomeView()
                .environmentObject(homeViewModel)
        }
    }
}
