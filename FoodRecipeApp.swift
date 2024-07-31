//
//  FoodRecipeApp.swift
//  FoodRecipe
//
//  Created by Kerem on 25.05.2024.
//

import SwiftUI

@main
struct FoodRecipeApp: App {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            
            if hasSeenOnboarding {
                TabBarView()
            }else {
                StartView()
            }
           
        }
    }
}
