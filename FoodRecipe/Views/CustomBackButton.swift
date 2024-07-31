//
//  CustomBackButton.swift
//  FoodRecipe
//
//  Created by Kerem on 7.06.2024.
//

import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .foregroundColor(Color.gray1)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
    }
}

#Preview {
    CustomBackButton()
}
