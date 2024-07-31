//
//  CommentRecipeCard.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct CommentRecipeCard: View {
    let recipe: RecipeComment
    var body: some View {
        
               VStack(alignment: .leading) {
//                   Spacer()
                   HStack {
                       VStack(alignment: .leading) {
                           Text(recipe.title)
                               .font(.headline)
                               .lineLimit(1)
                           
                           HStack(spacing: 2) {
                               ForEach(0..<5) { index in
                                   Image(systemName: index < Int(recipe.rating) ? "star.fill" : "star")
                                       .foregroundColor(index < Int(recipe.rating) ? Color.yellow : Color.gray)
                               }
                           }
                       }
                       Spacer()
                       Image(recipe.imageName)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 50, height: 50)
                           .clipShape(Circle())
                   }
                   
                   HStack {
                       Image(recipe.authorImageName)
                           .resizable()
                           .scaledToFill()
                           .frame(width: 25, height: 25)
                           .clipShape(Circle())
                       Text("By \(recipe.author)")
                           .font(.caption)
                           .foregroundColor(.secondary)
                   }
                   .padding(.top, 5)
                   
                   HStack {
                       Image(systemName: "clock")
                           .font(.caption)
                           .foregroundColor(.secondary)
                       Text(recipe.time)
                           .font(.caption)
                           .foregroundColor(.secondary)
                   }
                   .padding(.top, 5)
                   
                   Spacer()
               }
               .frame(height: 100)
               .padding()
               .background(Color.white)
               .cornerRadius(10)
               .shadow(radius: 5)
               .padding(.horizontal)
           }
    }


#Preview {
    CommentRecipeCard(recipe: RecipeComment(title: "coleslaw", rating: 4.5, time: "15 min", imageName: "coleslaw", author: "Julia", authorImageName: "coleslaw"))
}
