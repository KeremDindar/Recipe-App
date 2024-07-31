//
//  SignInView.swift
//  FoodRecipe
//
//  Created by Kerem on 25.05.2024.
//

import SwiftUI

struct SignInView: View {
    
    @AppStorage("email") var storedEmail: String = ""
    @AppStorage("password") var storedPassword: String = ""
    
    @State var email: String = ""
    @State var password: String = ""
    @State var navigate: Bool = false
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    
    
   
   
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text("Hello,")
                    .font(.headerTextBold)
                Text("Welcome Back!")
                    .font(.largeTextRegular)
            }
            .padding()
    //        Spacer().frame(height: 100)
            
            VStack(spacing: 20) {
                HStack {
                    Text("Email")
                        .font(.smallTextRegular)
                        .padding(.horizontal)
                    Spacer()
                }
                
                TextField("Enter Email", text: $email)
                    .padding()
                    .background(Color(.gray4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                HStack {
                    Text("Password")
                        .font(.smallTextRegular)
                        .padding(.horizontal)
                    Spacer()
                }
                
                SecureField("Enter Password", text: $password)
                    .padding()
                    .background(Color(.gray4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                HStack {
                    
                    // MARK: DESTINATION
                    Text("Forgot Password?")
                        .font(.smallerTextRegular)
                        .foregroundStyle(Color(.secondary100))
                        .padding(.horizontal,30)
                    Spacer()
                }
                
                //MARK: UNUTMA
                Button {
                    
                    // Code
                    if email == storedEmail && password == storedPassword {
                                navigate = true
                    } else {
                        if email != storedEmail {
                            alertMessage = "Incorrect email."
                        } else if password != storedPassword {
                            alertMessage = "Incorrect password."
                        }
                        showAlert = true
                        
                    }
                    
                } label: {
                    
                    
                        Text("Sing In ")
                            .font(.normalTextBold)
                            .frame(height: 56)
                            .frame(maxWidth: 315)
                            .background(Color(.primary100))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    
                }
                .alert(isPresented: $showAlert) {
                        Alert(
                        title: Text("Error"),
                        message: Text(alertMessage),
                            dismissButton: .default(Text("OK"))
                                    )
                                }
                
                
    //            Spacer()
                HStack {
                    VStack {
                        Divider()
                    }
                        .padding(.horizontal, 30)
                    Text("Or Sign in With")
                        .font(.smallTextRegular)
                        .foregroundStyle(Color(.gray4))
                    VStack {
                        Divider()
                    }
                        .padding(.horizontal, 30)
                          }
                HStack {
                    Image("google")
                        .padding()
                    Image("facebook")
                        .padding()
                }
                HStack {
                    Text("Dont have an account?")
                        .font(.smallTextRegular)
                    NavigationLink {
                        //Destination
                        SignUpView()
                        
                    } label: {
                        Text("Sign Up")
                            .foregroundStyle(.secondary100)
                    }

                }
                NavigationLink("", destination: TabBarView(), isActive: $navigate)
                                 
                
            }
            
                            
            
        }
        .navigationBarBackButtonHidden(true)
        
        
       
    }
    
}

#Preview {
    SignInView()
}
