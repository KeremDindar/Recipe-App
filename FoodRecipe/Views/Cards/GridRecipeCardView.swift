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
    GridRecipeCardView(recipe:Recipe(image: "food1", title: "asdasd", chef: Chef(name: "asdas", image: "food1", location: "asdad"), rating: 4, createdAt: .now, category: "asd", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300)], procedures: [Procedure(description: "adasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"))

}
