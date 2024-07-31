//
//  ContentView.swift
//  FoodRecipe
//
//  Created by Kerem on 26.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    
    
    let typeArray = [
        "All","Indian","Italian","Asian","Chinese","Turkish"
    ]
    @State var search: String = ""
    @State private var selectedType: String = "All"
    @State var isActive: Bool = false
    @State var showFilterSheet: Bool = false
    @State var goProfile: Bool = false
    
    @State var searchText: String = ""
    @State var selectedTime: String? = nil
    @State private var selectedRate: String? = nil
    @State private var selectedCategory: String? = nil
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Spacer().frame(height: 30)
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Hello Jega")
                            .font(.largeTextBold)
                            .padding(.bottom,7)
                        Text("What are you cooking today")
                            .font(.smallerTextRegular)
                            .foregroundStyle(.gray3)
                        
                    }
                    Spacer().frame(width: 140)
                    NavigationLink(destination: ProfileView(recipe:Recipe(image: "food1", title: "asdasd", chef: Chef(name: "asdas", image: "food1", location: "Istanbul"), rating: 4, createdAt: .now, category: "asd", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "ajkshfgakjshgkdsghsdkgjsdkasdasdasdasdjg"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgasfasdasdasasfdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"))
                                   
                                   ,isActive: $goProfile) {
                        Button {
                            
                            // go to profile
                           goProfile = true
                            
                        } label: {
                            Image("profile")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .background(Color.secondary40)
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                    }
                    }
                    

                }
                Spacer().frame(height: 30)
                HStack {
                    NavigationLink(destination: GridRecipeCard(),isActive: $isActive) {
                        Button {
                            
                         isActive = true
                            
                        } label: {
                            TextField("Search Recipe", text: $search)
                                .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 280,height: 40)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray3)
                                            )
                        }

                    }

                 
                    .padding(.leading)
                    Spacer()
                    

                    Button(action: {
                        // Action for filter button
                        
                        showFilterSheet.toggle()
                        
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding()
                            .background(Color.primary100)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showFilterSheet, content: {
                        ShowFilter(selectedTime: $selectedTime, selectedRate: $selectedRate, selectedCategory: $selectedCategory)
                    })
                }
                .padding(.bottom)
                
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(typeArray, id: \.self) { type in
                            Text(type)
                                .font(.smallTextBold)
                                .padding()
                                .background(selectedType == type ? Color.primary100 : Color.clear)
                                .cornerRadius(10)
                                .foregroundColor(selectedType == type ? .white : .primary)
                                .onTapGesture {
                                selectedType = type
                                    }

                        }
                    }
                }
                    
                
                
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(recipes) { recipe in
                            RecipeCard(recipe: recipe)
                        }
                    }
                    .padding(.leading)
                }
                
                HStack() {
                    Text("New Recipes")
                        .font(.normalTextBold)
                    Spacer().frame(width: 200)
                }
                .padding(.bottom)
                
                

                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(commentRecipes) { recipe in
                            CommentRecipeCard(recipe: recipe)
                            
                        }
                    }
                    .padding(.bottom)
                
                }
                
               
            }
           
            
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    ContentView()
}
