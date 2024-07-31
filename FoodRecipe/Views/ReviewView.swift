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
    ReviewView(recipe: Recipe(image: "food1", title: "sdjghsdkj", chef: Chef(name: "asd", image: "food1", location: "sdkjhfsdkjgf"), rating: 3, createdAt: .now, category: "sdfasf", isPopular: true, prepareTime: 20000, ingridents: [Ingrident(image: "food1", name: "lsdhgkjsdg", amount: 200)], procedures: [Procedure(description: "asljfaslkf")], comment: "kdsbgjsdgbkjsdg"))
}
