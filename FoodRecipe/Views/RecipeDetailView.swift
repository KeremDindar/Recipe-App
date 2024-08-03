//
//  RecipeDetailView.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    @State private var selectedTab: String = "Ingrident"
    @State var showRating: Bool = false
    @State var showShare: Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
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
                    
                    HStack {
                        Text(recipe.title)
                            .font(.largeTextBold)
                        
                        
                        Spacer()
                        
                        Text("(13K Reviews)")
                            .foregroundStyle(.gray2)
                    }
                    .padding()
                    
                    HStack {
                        Image(recipe.chef.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                            .clipShape(Circle())
                        VStack {
                            Text(recipe.chef.name)
                            HStack {
                                Image(systemName: "location.north.circle")
                                Text(recipe.chef.location)
                                    .padding(-4)
                            }
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Follow")
                                .frame(height: 50)
                                .frame(maxWidth: 100)
                                .background(Color.primary100)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                        }
                        
                        
                    }
                    .padding([.leading,.trailing])
                    
                    HStack {
                        Button(action: {
                            selectedTab = "Ingrident"
                        }) {
                            Text("Ingrident")
                                .font(.headline)
                                .padding()
                                .frame(width: 180)
                                .background(selectedTab == "Ingrident" ? Color.primary100 : Color.white)
                                .foregroundColor(selectedTab == "Ingrident" ? .white : .primary100)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedTab = "Procedure"
                        }) {
                            Text("Procedure")
                                .font(.headline)
                                .padding()
                                .frame(width: 180)
                                .background(selectedTab == "Procedure" ? Color.primary100 : Color.white)
                                .foregroundColor(selectedTab == "Procedure" ? .white : .primary100)
                                .cornerRadius(10)
                        }
                        
                    }
                    HStack{
                        Image(systemName: "fork.knife")
                        Text("1 Serve")
                        Spacer().frame(width: 220)
                        if selectedTab == "Ingrident" {
                            Text("\(recipe.ingridents.count) Items")
                        } else if  selectedTab == "Procedure" {
                            Text("\(recipe.procedures.count) Steps")
                        }
                        
                    }
                    .padding()
                    
                    
                    if selectedTab == "Ingrident" {
                        
                        VStack {
                            
                            ForEach(recipe.ingridents) {ingrident in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray4)
                                    .shadow(radius: 3)
                                    .frame(width: 370, height: 80)
                                    .overlay(
                                        HStack {
                                            Image(ingrident.image)
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                            
                                            Text(ingrident.name)
                                                .font(.mediumTextBold)
                                            
                                            Spacer()
                                            Text("\(ingrident.amount)g")
                                            
                                            
                                        }
                                            .padding()
                                    )
                                    .padding(.vertical,5)
                                
                            }
                        }
                        
                    }
                    else {
           
                        VStack {
                            ForEach(recipe.procedures.indices, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray4)
                                    .shadow(radius: 3)
                                    .frame(width: 370, height: 80)
                                    .overlay(
                                        VStack(alignment: .leading) {
                                            Text("Step \(index + 1)")
                                                .font(.headline)
                                                .padding(.leading,10)
                                            
                                            
                                            HStack {
                                                
                                                Text(recipe.procedures[index].description)
                                                    .padding(.leading)
                                                
                                                Spacer()
                                                
                                            }
                                            
                                            
                                        })
                                
                                    .padding(.vertical,5)
                                //                                    .background(Color.gray4)
                                //                                    .cornerRadius(10)
                                
                            }
                        }
                        
                        
                        
                        
                        
                        
                    }
                }
            }
            
            Spacer()
            
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {
                        // Paylaşım aksiyonu
                        showShareWithAnimation(isShow: true)
                        
                        
                        
                        
                    }) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(action: {
                        // Derecelendirme
                        showRatingWithAnimation(isShow: true)
                        
                    }) {
                        Label("Rate Recipe", systemImage: "star.fill")
                    }
                    NavigationLink(destination: ReviewView(recipe: recipe)) {
                        Label("Review", systemImage: "pencil")
                    }
                    Button(action: {
                        // Kaydedilenlerden silme
                        
                    }) {
                        Label("Unsave", systemImage: "eraser.fill")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .padding()
                }
                
                
                
                
            }
            
        }
        .overlay(content: {
            if showShare {
                ShareLinkView {
                    showShareWithAnimation(isShow: false)
                    
                }
                
            }
            
        })
        .overlay(content: {
            if showRating {
                RatingView {
                    showRatingWithAnimation(isShow: false)
                }
            }
        })
        
        
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarLeading) {
        //                CustomBackButton()
        //            }
        //        }
        
        .navigationBarBackButtonHidden(true)
    }
    func showShareWithAnimation(isShow: Bool) {
        withAnimation {
            showShare = isShow
        }
    }
    func showRatingWithAnimation(isShow: Bool) {
        withAnimation {
            showRating = isShow
        }
    }
    
}

#Preview {
    RecipeDetailView(recipe: Recipe(
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


