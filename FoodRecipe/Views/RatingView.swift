//
//  RatingView.swift
//  FoodRecipe
//
//  Created by Kerem on 30.06.2024.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Int = 0
   

    var completion: (() -> Void)
    
    var body: some View {

        ZStack {
            Color(.black)
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                        Text("Rate Recipe")
                            .font(.mediumTextRegular)
                            .padding()
                        HStack {
                            ForEach(1..<6) { index in
                                Image(systemName: "star")
                                    .foregroundColor(index <= rating ? Color.orange : Color.gray)
                                    .onTapGesture {
                                        rating = index
                                    }
                            }
                        }
                        .padding(.bottom,10)
                        
                        Button {
                            if rating > 0 {
                               completion()
                            }
                    
                        } label: {
                            Text("Send")
                                .foregroundStyle(.white)
                                .frame(width: 90,height: 30)
                                .background(rating > 0 ? Color.orange : Color.gray3)
                                .cornerRadius(8)
                                
                                
                        }

            }
            
            
            .padding()
            .background(Color.white)
            .cornerRadius(5)
        .shadow(radius: 20)
        }
            
        
            
        
    }
}

#Preview {
    RatingView { }
}
