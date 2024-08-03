//
//  ReviewView.swift
//  FoodRecipe
//
//  Created by Kerem on 30.06.2024.
//

import SwiftUI

struct ReviewView: View {
    let recipe: Recipe
    @State var commentField: String = ""
    var body: some View {
        ScrollView {
            VStack {
                
                Text("Reviews")
                    .font(.headerTextBold)
                HStack {
                    Text("\(recipe.comment.count) Comments")
                        .foregroundStyle(.gray2)
                        .font(.smallTextRegular)
                    Spacer().frame(width: 190)
                    Text("155 Saved")
                        .foregroundStyle(.gray2)
                        .font(.smallTextRegular)
                }
                .padding()
               HStack{
                    Text("Leave a comment")
                        .font(.mediumTextRegular)
                   Spacer().frame(width: 220)
                       
                }
                HStack {
                    TextField("Say Something...", text: $commentField)
                        .padding(.leading, 10)
                        .frame(width: 300,height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button {
                        
                    } label: {
                        Text("Send")
                            .foregroundStyle(.white)
                            .frame(width: 70,height: 40)
                            .background(Color.primary100)
                            .cornerRadius(10)
                    }
                }
                

                
                
               
                    ForEach(recipes) { recipe in
                        ReviewCommentView(recipe: recipe)
                    }
                
               
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton()
                }
            }
        .navigationBarBackButtonHidden(true)
        }
    }
   
}

#Preview {
    ReviewView(recipe: Recipe(
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
