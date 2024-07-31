//
//  ReviewCommentView.swift
//  FoodRecipe
//
//  Created by Kerem on 30.06.2024.
//

import SwiftUI

struct ReviewCommentView: View {
    let recipe: Recipe
    
    @State var dislikeBackground: Bool = false
    @State var likeBackground : Bool = false
    @State var islike: Bool = false
    @State var likeCount: Int = 0
    @State var dislikeCount: Int = 0
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium // Tarih stilini belirleyin (short, medium, long, full)
            formatter.timeStyle = .none // Zaman stilini belirleyin (none, short, medium, long, full)
            return formatter
        }

    
    var body: some View {
        VStack {
            HStack {
                Image("food1")
                    .resizable()
                    .frame(width: 55,height: 55)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(recipe.chef.name)
                        .font(.mediumTextBold)
                    Text("\(dateFormatter.string(from: recipe.createdAt))")
                        .foregroundStyle(.gray2)
                        .font(.smallTextRegular)
                    
                }
               
            }.padding(.trailing, 175)
            
            VStack {
                Text(recipe.comment)
                    .frame(width: 270)
                    .font(.mediumTextRegular)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill( likeBackground ?  .primary80 : .primary40)
                            .cornerRadius(20)
                                .frame(width: 80, height: 40)
                        
                        
                        HStack {
                            Button {
                                likeBackground.toggle()
                                likeCount += 1
                            } label: {
                                Image(systemName: "hand.thumbsup.fill")
                                    .foregroundColor(Color.orange)
                            }
                            Text("\(likeCount)")
                        }
                        
                       
                    }
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(dislikeBackground ?  .primary80 : .primary40)
                            .cornerRadius(20)
                                .frame(width: 80, height: 40)
                        HStack {
                            Button {
                                
                                dislikeCount += 1
                                dislikeBackground.toggle()
                            } label: {
                                Image(systemName: "hand.thumbsdown.fill")
                                    .foregroundColor(.orange)
                        }
                            Text("\(dislikeCount)")
                        }
                        
                    }

                }
                .padding(.trailing,100)

            }
            
            .padding(.leading, -50)
            
            }
        }
    }


#Preview {
    ReviewCommentView(recipe: Recipe(image: "food1", title: "asdas", chef: Chef(name: "Kerem", image: "food1", location: "asfas"), rating: 4, createdAt: .now, category: "asdasd", isPopular: true, prepareTime: 20000, ingridents: [Ingrident(image: "asda", name: "asfa", amount: 224)], procedures: [Procedure(description: "asdasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"))
}
