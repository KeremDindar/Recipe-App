//
//  NotificationView.swift
//  FoodRecipe
//
//  Created by Kerem on 28.05.2024.
//

import SwiftUI

struct Notification: Identifiable {
    var id = UUID()
    var type: NotificationType
    var message: String
    var timeAgo: String
}

enum NotificationType {
    case newRecipe
    case saveRecipe
}



struct NotificationView: View {
    
    var notificationsToday: [Notification] = [
            Notification(type: .newRecipe, message: "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum", timeAgo: "10 mins ago"),
            Notification(type: .newRecipe, message: "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum", timeAgo: "30 mins ago"),
            Notification(type: .saveRecipe, message: "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum", timeAgo: "30 mins ago")
        ]
        
        var notificationsYesterday: [Notification] = [
            Notification(type: .newRecipe, message: "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum", timeAgo: "30 mins ago"),
            Notification(type: .saveRecipe, message: "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum", timeAgo: "30 mins ago")
        ]
    
    
    @State var selectedTab: String = "All"
    
    
    var body: some View {
        VStack {
            Text("Notifications")
                .font(.headerTextBold)
            HStack {
                Button(action: {
                    selectedTab = "All"
                }) {
                    Text("All")
                        .font(.mediumTextBold)
                        .padding()
                        .frame(width: 120)
                        .background(selectedTab == "All" ? Color.primary100 : Color.white)
                        .foregroundColor(selectedTab == "All" ? .white : .primary100)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    selectedTab = "Read"
                }) {
                    Text("Read")
                        .font(.mediumTextBold)
                        .padding()
                        .frame(width: 120)
                        .background(selectedTab == "Read" ? Color.primary100 : Color.white)
                        .foregroundColor(selectedTab == "Read" ? .white : .primary100)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    selectedTab = "Unread"
                }) {
                    Text("Unread")
                        .font(.mediumTextBold)
                        .padding()
                        .frame(width: 120)
                        .background(selectedTab == "Unread" ? Color.primary100 : Color.white)
                        .foregroundColor(selectedTab == "Unread" ? .white : .primary100)
                        .cornerRadius(10)
                }

            }
            .padding(.horizontal)
            
            
            ScrollView {
                VStack(alignment: .leading) {
                                    Text("Today")
                                        .font(.headline)
                                        .padding(.horizontal)
                                    
                                    ForEach(notificationsToday) { notification in
                                        NotificationCard(notification: notification)
                                    }
                                    
                                    Text("Yesterday")
                                        .font(.headline)
                                        .padding(.horizontal)
                                    
                                    ForEach(notificationsYesterday) { notification in
                                        NotificationCard(notification: notification)
                                    }
                                }
                            }
                        }
                    }
                }

               


#Preview {
    NotificationView()
}
