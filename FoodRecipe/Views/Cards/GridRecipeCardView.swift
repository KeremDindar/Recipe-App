//
//  GridRecipeCardView.swift
//  FoodRecipe
//
//  Created by Kerem on 29.05.2024.
//

import SwiftUI

struct GridRecipeCardView: View {
    let recipe: Recipe
    var body: some View {
       
        ZStack(alignment: .bottom) {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170,height: 170)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text(recipe.title)
                            .font(.smallTextBold)
                            .foregroundColor(.white)
                            .padding([.horizontal, .top])
                        
                        HStack {
                            Text("By \(recipe.chef.name)")
                                .font(.smallerTextRegular)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("\(recipe.rating)")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                }
                .frame(width: 170,height: 170)
                .cornerRadius(10)
                .shadow(radius: 5)
           
        
    }
}

#Preview {
    GridRecipeCardView(recipe:Recipe(image: "food1", title: "Traditional Spare Ribs Baked", chef: Chef(name: "Laura Wilso", image: "food1", location: "Los Angeles, CA"), rating: 4, createdAt: .now, category: "Cereal", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "Strawberries", amount: 300)], procedures: [Procedure(description: "Serve immediately and enjoy!")], comment: "A delicious and refreshing smoothie perfect for breakfast or a snack"))

}

