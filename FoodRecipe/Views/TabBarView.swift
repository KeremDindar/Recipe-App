//
//  TabBarView.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
            .tabItem {
                Image(systemName: "house")
            }
           
            SaveView()
            .tabItem {
                Image(systemName: "bookmark")
            }
            AddView()
                .tabItem {
                    Image(systemName: "plus.app")
                }
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                }
            ProfileView(recipe: Recipe(
                image: "food1",
                title: "Traditional Spare Ribs Baked",
                chef: Chef(name: "Laura Wilson", image: "food1", location: "Los Angeles, CA"),
                rating: 4,
                createdAt: .now,
                category: "Cereal",
                isPopular: true,
                prepareTime: 20,
                ingridents: [
                    Ingrident(image: "food1", name: "Strawberries", amount: 200),
                    Ingrident(image: "food2", name: "Milk", amount: 200)
                ],
                procedures: [
                    Procedure(description: "Combine all ingredients in a blender and blend until smooth."),
                    Procedure(description: "Serve immediately and enjoy!")
                ],
                comment: "A delicious and refreshing smoothie perfect for breakfast or a snack."
            ))
            
        
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    TabBarView()
}
