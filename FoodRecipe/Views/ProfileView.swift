//
//  ProfileView.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    let recipe: Recipe
    
    @State var recipeCount: Int = 0
    @State var followersCount: Double = 0
    @State var followingCount: Double = 0
    @State var selectedTab: String = "Recipe"
    @AppStorage("name") var storedName: String = ""
//    let chefBio: String = "bsdnkjsbdgkjbdsgkjbsdkgbdskgbsdkgbdskbgsdbgsdkjbgsdgbsdbgsdkjbgdsjkgbskdgbs"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Text("Profile")
                            .font(.headerTextBold)
                        Spacer().frame(width: 100)
                        Button {
                         //

                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .padding()
                        }

                    }
                    
                    HStack {
                        Image(recipe.chef.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100,height: 100)
                            .clipShape(Circle())
                            .padding()
                            .padding(.trailing,10)
                        VStack {
                            Text("Recipe")
                                .font(.smallTextRegular)
                                .foregroundColor(.gray2)
                            Text("\(recipes.count)")
                                .font(.mediumTextBold)
                            
                        }
                        VStack {
                            Text("Followers")
                                .font(.smallTextRegular)
                                .foregroundColor(.gray2)
                            Text("2.5M")
                                .font(.mediumTextBold)
                        }
                        .padding()
                        
                        VStack {
                            Text("Fallowing")
                                .font(.smallTextRegular)
                                .foregroundColor(.gray2)
                            Text("259")
                                .font(.mediumTextBold)
                        }
                    }
                    Text(storedName)
                        .font(.largeTextBold)
                        .padding(.leading,32)
                    
                    Text("Chef")
                        .font(.smallTextRegular)
                        .padding(.leading,32)
                        .foregroundColor(.gray2)
                    
                        Text("Private Chef")
                        .font(.smallTextRegular)
                        .foregroundStyle(.gray1)
                        .padding(.top,2)
                        .padding(.leading,32)
                    Text("Passionate about food and life 🥘🍲🍝🍱")
                        .padding(.leading,32)
                        .font(.smallTextRegular)
                        .foregroundColor(.gray1)
                    Text("More")
                        .font(.smallTextRegular)
                        .foregroundStyle(.gray1)
                        .padding(.leading,32)
                }
                VStack {
                    HStack{
                        Button(action: {
                            selectedTab = "Recipe"
                        }) {
                            Text("Recipe")
                                .font(.mediumTextBold)
                                .padding()
                                .frame(width: 120)
                                .background(selectedTab == "Recipe" ? Color.primary100 : Color.white)
                                .foregroundColor(selectedTab == "Recipe" ? .white : .primary100)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedTab = "Videos"
                        }) {
                            Text("Videos")
                                .font(.mediumTextBold)
                                .padding()
                                .frame(width: 120)
                                .background(selectedTab == "Videos" ? Color.primary100 : Color.white)
                                .foregroundColor(selectedTab == "Videos" ? .white : .primary100)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedTab = "Tag"
                        }) {
                            Text("Tag")
                                .font(.mediumTextBold)
                                .padding()
                                .frame(width: 120)
                                .background(selectedTab == "Tag" ? Color.primary100 : Color.white)
                                .foregroundColor(selectedTab == "Tag" ? .white : .primary100)
                                .cornerRadius(10)
                        }

                    }
                    .padding()
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            SaveItemCard(recipe: recipe)
                        }

                        
                    }
                }
                }
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing, content: <#T##() -> View#>)
//            }
            
            .navigationBarBackButtonHidden(true)
        }
        }
    }


#Preview {
    ProfileView(recipe:Recipe(image: "food1", title: "asdasd", chef: Chef(name: "Kerem", image: "food1", location: "Istanbul"), rating: 4, createdAt: .now, category: "asd", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "ajkshfgakjshgkdsghsdkgjsdkasdasdasdasdjg"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgasfasdasdasasfdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"))
    
}
