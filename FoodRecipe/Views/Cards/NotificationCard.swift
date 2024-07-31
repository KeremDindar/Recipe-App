//
//  NotificationCard.swift
//  FoodRecipe
//
//  Created by Kerem on 1.07.2024.
//

import SwiftUI





struct NotificationCard: View {
    
    let notification: Notification
    
    
    var body: some View {
        HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(notification.type == .newRecipe ? "New Recipe Alert!" : "Save Recipe Alert!")
                                .font(.mediumTextBold)
                            .padding(.bottom, 1)
                            Spacer()
                            Image(systemName: notification.type == .newRecipe ? "bell.fill" : "bookmark.fill")
                                .foregroundColor(Color.orange)
                                .padding()
                        }
                        Text(notification.message)
                            .font(.smallTextRegular)
                            .foregroundColor(.gray2)
                        Text(notification.timeAgo)
                            .font(.smallerTextRegular)
                            .foregroundColor(.gray2)
                    }
                   
                }
                .padding()
                .background(Color.gray4)
                .cornerRadius(10)
                .padding(.horizontal)
    }
}

#Preview {
    NotificationCard(notification: Notification(type: .newRecipe, message: "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum", timeAgo: "10 mins ago"))
       
}
