//
//  StartView.swift
//  FoodRecipe
//
//  Created by Kerem on 25.05.2024.
//

import SwiftUI

struct StartView: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        NavigationStack {
            
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 50)
                
                VStack {
                    Image(systemName: "cloud.heavyrain.fill")
                        .resizable()
                        .frame(width: 79,height: 79)
                        .foregroundColor(.white)
                        .padding(40)
                    Text("100K+ Premium Recipe")
                        .font(.mediumTextBold)
                        .foregroundStyle(.white)
                    
                }
                Spacer()
                Spacer()
                VStack(spacing: 20) {
                    Text("Get Cooking")
                        .font(.headerTextBold)
                        .foregroundStyle(.white)
                    
                    
                    Text("Simple way to find Tasty Recipe")
                        .foregroundStyle(.white)
                        .font(.normalTextRegular)
                    
                    
                    
                        
                        // Code
                        NavigationLink(destination: SignInView(),isActive: $hasSeenOnboarding) {
                            
                            Button {
                                hasSeenOnboarding = true
                            } label: {
                                Text("Start Cooking ")
                                    .font(.normalTextBold)
                                    .frame(height: 50)
                                    .frame(maxWidth: 300)
                                    .background(Color(.primary100))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding()
                            }

                        }

                }
                Spacer()
                
            }
            }
        }
        
        
    }
}

#Preview {
    NavigationView {
        StartView()
    }
    
}
