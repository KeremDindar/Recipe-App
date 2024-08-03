//
//  RecipeCard.swift
//  FoodRecipe
//
//  Created by Kerem on 26.05.2024.
//

import SwiftUI

struct RecipeCard: View {
    
    let recipe: Recipe
    
    var body: some View {
        NavigationLink(
            destination: RecipeDetailView(recipe: recipe)) {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4)
                            )
                            .shadow(radius: 5)
                        
                        
                        Text("⭐ \(recipe.rating)")
                            .font(.smallerTextRegular)
                            .padding(5)
                            .background(Color.yellow)
                            .clipShape(Capsule())
                            .padding([.top, .trailing], 10)
                        
                    }
                    Text(recipe.title)
                        .font(.smallTextBold)
                        .foregroundStyle(.gray1)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .frame(maxWidth: 100)
                        .padding(.top, 5)
                    
                    VStack {
                        HStack {
                            Text("Time")
                                .font(.smallTextRegular)
                                .foregroundStyle(.gray3)
                                .padding(.top,3)
                            Spacer().frame(width: 160)
                            
                            
                        }
                        
                        HStack {
                            Text("\(Int(recipe.prepareTime)) Mins")
                                .font(.smallTextRegular)
                                .foregroundStyle(.gray1)
                                .padding(.top,3)
                            Spacer().frame(width: 120)
                            
                            Button {
                                // Add code
                                
                            } label: {
                                Image("save")
                                    .foregroundColor(.primary80)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.gray3, lineWidth: 4)
                                    )
                            }
                            
                            
                            
                        }
                        
                    }
                    .padding(.horizontal,10)
                    .padding(.bottom,5)
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .padding()
                .padding()
            }
    }
    
}

#Preview {
    RecipeCard(recipe: Recipe(
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
}
