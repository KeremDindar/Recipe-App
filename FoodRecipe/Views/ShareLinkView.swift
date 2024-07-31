//
//  ShareLinkView.swift
//  FoodRecipe
//
//  Created by Kerem on 30.06.2024.
//

import SwiftUI

struct ShareLinkView: View {
   
    var completion: (() -> Void)
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.3)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Recipe Link")
                        .font(.largeTextBold)
                    Spacer().frame(width: 220)
                    Button {
                       completion()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.smallTextBold)
                            .foregroundColor(.black)
                    }

                }
                    
                Text("Copy recipe link and share your recipe link with  friends and family.")
                    .foregroundStyle(Color.gray2)
                HStack {
                    Text("app.Recipe.co/jollof_rice")
                        .padding()
                        .background(Color.gray4)
                    .cornerRadius(10)
    //                Spacer().frame(width: -80)
                    
                    Button {
                        UIPasteboard.general.string = "app.Recipe.co/jollof_rice"
                    } label: {
                        Text("Copy Link")
                            .foregroundStyle(Color.white)
                            .padding()
                            .background(Color.primary100)
                            .cornerRadius(10)
                    }

                }
               
            }
            .padding()
            .frame(width: 400,height: 200)
            .background(Color.white)
            .cornerRadius(5)
        .shadow(radius: 20)
        }
        
        
        
        
    }
}

#Preview {
    ShareLinkView { }
}
