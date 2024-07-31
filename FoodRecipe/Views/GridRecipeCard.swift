//
//  GridRecipeCard.swift
//  FoodRecipe
//
//  Created by Kerem on 29.05.2024.
//

import SwiftUI



struct GridRecipeCard: View {
    
 
    @State var showFilterSheet: Bool = false
    @State var searchText: String = ""
    @State var selectedTime: String? = nil
    @State private var selectedRate: String? = nil
    @State private var selectedCategory: String? = nil
    
    //
    //Computed Property = Hesaplanmış Özellik class struct enum gibi bir değeri saklamak yerine her çağrıldığında hesaplama yapar. güncellenmesi gereken değerler için kullanılır. örn: geometri hesaplama gibi
    
    var filteredRecipes: [Recipe] {
        var result = recipes
        
        // Arama metni filtresi
        if !searchText.isEmpty {
            result = result.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.chef.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        // Zaman filtresi
        if let time = selectedTime {
            switch time {
            case "Newest":
                result.sort { $0.createdAt > $1.createdAt }
            case "Oldest":
                result.sort { $0.createdAt < $1.createdAt }
            case "Popularity":
                //sort yerine filter kullandık çünkü sort 2 nesneyi karşılaştırmak için kullanılır. Sort clouseru 2 nesneyi kapsar
                result = result.filter { $0.isPopular }
            default:
                break
            }
        }
        
        // Derecelendirme filtresi
        //selectedrate nil değilse bir değeri varsa rate a atar rate ınt e döndürülebiliyosa döndürülüp ratevalue olarak tanımlanır eğer seçilen değer ratevalueden bbüyük ve eşit olanları filtreler
        
        if let rate = selectedRate, let rateValue = Int(rate) {
            result = result.filter { Int($0.rating) >= rateValue }
        }
        
        // Kategori filtresi
        //selected category boş değilse categorye eşitler category all değilse filtreleme yapar tariflerin categorysi seçilen categorye eşit olanları filtreler
        
        if let category = selectedCategory, category != "All" {
            result = result.filter { $0.category == category }
        }
        
        return result
    }
    
    
    
    
    
    
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    TextField("Search recipe", text: $searchText)
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    
                    
                    
                    
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
                .padding()
                
                
                HStack {
                    if !searchText.isEmpty {
                        Text("Search Results")
                            .font(.normalTextBold)
                            .bold()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        
                        Text("\(filteredRecipes.count) results")
                            .font(.normalTextRegular)
                            .padding(.trailing)
                    }else {
                        Text(" Recent Search")
                            .font(.normalTextBold)
                            .bold()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                
                
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(filteredRecipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                GridRecipeCardView(recipe: recipe)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
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


#Preview {
    GridRecipeCard()
}
