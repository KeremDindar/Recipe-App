//
//  RecipeComment.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import Foundation


struct RecipeComment: Identifiable {
    let id = UUID()
       let title: String
       let rating: Double
       let time: String
       let imageName: String
       let author: String
       let authorImageName: String
   }

   let commentRecipes = [
       RecipeComment(title: "Classic Greek Salad", rating: 4.5, time: "15 Mins", imageName: "greek_salad", author: "James Milner", authorImageName: "food1"),
       RecipeComment(title: "Crunchy Nut Coleslaw", rating: 3.5, time: "10 Mins", imageName: "coleslaw", author: "Laura Johnson", authorImageName: "laura")
   ]

