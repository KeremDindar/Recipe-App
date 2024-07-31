//
//  TabBarView.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
            .tabItem {
                Image(systemName: "house")
            }
           
            SaveView()
            .tabItem {
                Image(systemName: "bookmark")
            }
            AddView()
                .tabItem {
                    Image(systemName: "plus.app")
                }
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                }
            ProfileView(recipe:Recipe(image: "food1", title: "asdasd", chef: Chef(name: "asdas", image: "food1", location: "Istanbul"), rating: 4, createdAt: .now, category: "asd", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "ajkshfgakjshgkdsghsdkgjsdkasdasdasdasdjg"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgasfasdasdasasfdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"))
            
        
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    TabBarView()
}
