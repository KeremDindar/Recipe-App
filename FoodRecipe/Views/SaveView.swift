//
//  SaveView.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct SaveView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Saved recipes")
                    .font(.headerTextBold)
                    .padding()
                ScrollView {
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            SaveItemCard(recipe: recipe)
                        }

                        
                    }
                }
            }
        }
    }
}

#Preview {
    SaveView()
}
