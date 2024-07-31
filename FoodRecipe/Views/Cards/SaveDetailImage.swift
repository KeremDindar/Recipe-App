//
//  SaveDetailImage.swift
//  FoodRecipe
//
//  Created by Kerem on 27.06.2024.
//

import SwiftUI

struct SaveDetailImage: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            ZStack {
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350,height: 200)
                    .cornerRadius(15)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]), startPoint: .bottom, endPoint: .top)
                            .cornerRadius(15)
                    )
                
                VStack{
                    Spacer().frame(height: 130)
                    
                    
                    
                    HStack {
                        
                            
                        Spacer()
                        Label("15 Minute", systemImage: "clock")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                        Button {
                            //MARK: UNUTMA
                            
                        } label: {
                            Image("save")
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.trailing, 30)
                        }

                        
                            
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    SaveDetailImage(recipe:Recipe(image: "food1", title: "asdasd", chef: Chef(name: "asdas", image: "food1", location: "asdad"), rating: 4, createdAt: .now, category: "asd", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300)], procedures: [Procedure(description: "adasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"))
                 
}

