//
//  ShowFilter.swift
//  FoodRecipe
//
//  Created by Kerem on 31.05.2024.
//

import SwiftUI



struct ShowFilter: View {
    
    
    @Binding  var selectedTime: String?
    @Binding  var selectedRate: String?
    @Binding  var selectedCategory: String?
    @Environment(\.dismiss) var dismiss
    
    let timeOptions = ["All", "Newest", "Oldest", "Popularity"]
    let rateOptions = ["5", "4", "3", "2"," 1"]
    let categoryOptions = ["All", "Cereal", "Vegetables", "Dinner" ]
    let categoryOptions2 = ["Chinese", "Local Dish", "Fruit", "Breakfast"]
    let categoryOptions3 = [  "Spanish", "Lunch"]
    
    
    
    var body: some View {
        
        VStack {
            

            VStack {
                VStack {
                    Text("Filter Search")
                        .font(.mediumTextBold)
                }
                VStack(alignment: .leading) {
                    Text("Time")
                        .font(.smallTextBold)
                        .padding(.top,20)
                    HStack {
                        ForEach(timeOptions, id: \.self) { time in
                            Button {
                                selectedTime = time
                                
                            } label: {
                                Text(time)
                                    .foregroundStyle(selectedTime == time ? .white : .primary100)
                                    .padding()
                                    .background(selectedTime == time ? Color.primary100 : Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedTime == time ? Color.clear : Color.primary100))
                                
                            }
                            
                        }
                    }
                    .padding(.bottom)
                    
                    Text("Rate")
                    HStack {
                        ForEach(rateOptions, id: \.self) { rate in
                            Button {
                                selectedRate = rate
                                
                            } label: {
                                Label(rate, systemImage: "star.fill")
                                    .font(.smallTextRegular)
                                    .foregroundStyle(selectedRate == rate ? .white : .primary100)
                                    .padding()
                                    .background(selectedRate == rate ? Color.primary100 : Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedRate == rate ? Color.clear : Color.primary100))
                                
                            }
                            
                        }
                    }
                    .padding(.bottom)
                    Text("Category")
                    HStack {
                        ForEach(categoryOptions, id: \.self) { category in
                            Button {
                                selectedCategory = category
                                
                            } label: {
                                Text(category)
                                    .font(.smallTextRegular)
                                    .foregroundStyle(selectedCategory == category ? .white : .primary100)
                                    .padding()
                                    .background(selectedCategory == category ? Color.primary100 : Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedCategory == category ? Color.clear : Color.primary100))
                                
                                
                            }
                            
                        }
                    }
                    HStack {
                        ForEach(categoryOptions2, id: \.self) { category in
                            Button {
                                selectedCategory = category
                                
                            } label: {
                                Text(category)
                                    .font(.smallTextRegular)
                                    .foregroundStyle(selectedCategory == category ? .white : .primary100)
                                    .padding()
                                    .background(selectedCategory == category ? Color.primary100 : Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedCategory == category ? Color.clear : Color.primary100))
                                
                                
                            }
                            
                        }
                    }
                    HStack {
                        ForEach(categoryOptions3, id: \.self) { category in
                            Button {
                                selectedCategory = category
                                
                            } label: {
                                Text(category)
                                    .font(.smallTextRegular)
                                    .foregroundStyle(selectedCategory == category ? .white : .primary100)
                                    .padding()
                                    .background(selectedCategory == category ? Color.primary100 : Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedCategory == category ? Color.clear : Color.primary100))
                                
                                
                            }
                            
                        }
                    }
                    
                    
                  
                }
            }
            .padding(.bottom,30)
            Button(action: {
                // Button action goes here
                dismiss()
            }) {
                Text("Filter")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 174, height: 37)
                    .background(Color.primary100)
                    .cornerRadius(20)
            }
            
            
            
        }
        //Spacer()
    }
    
}







#Preview {
    ShowFilter(selectedTime: .constant("Newest"), selectedRate: .constant("4"), selectedCategory: .constant("Dinner"))
}
