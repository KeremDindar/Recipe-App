//
//  SignUpView.swift
//  FoodRecipe
//
//  Created by Kerem on 26.05.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @AppStorage("name") var storedName: String = ""
    @AppStorage("email") var storedEmail: String = ""
    @AppStorage("password") var storedPassword: String = ""
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var isAccepted: Bool = false
    @State var showAlert: Bool = false
    @State  var shouldNavigate: Bool = false
    @State var alertMessage: String = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Create an account")
                        .font(.largeTextBold)
                        .padding(.vertical,4)
                    Text("Lets help you set up your account,")
                        .font(.smallerTextRegular)
                    Text("it wont take a long.")
                        .font(.smallerTextRegular)
                }
                .padding()
                Spacer()
            }
            
            
            
            VStack(spacing: 20) {
                HStack {
                    Text("Name")
                        .font(.smallTextRegular)
                        .padding(.horizontal)
                    Spacer()
                }
                
                TextField("Enter name", text: $name)
                    .padding()
                    .background(Color(.gray4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
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
                    Text("Confirm Password")
                        .font(.smallTextRegular)
                        .padding(.horizontal)
                    Spacer()
                }
                
                SecureField("Retype Password", text: $confirmPassword)
                    .padding()
                    .background(Color(.gray4))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            
            
            HStack() {
                Button(action: {
                    isAccepted.toggle()
                }) {
                    Image(systemName: isAccepted ? "checkmark.square.fill" : "square")
                        .foregroundColor(.orange)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(PlainButtonStyle())
                
                Text("Accept terms & Condition")
                    .foregroundColor(.orange)
                
                Spacer().frame(width: 120)
            }
            .padding()
            
            VStack {
                Button {
                    
                    if validateFields(){
                        storedName = name
                        storedEmail = email
                        storedPassword = password
                        shouldNavigate = true
                    } else {
                        showAlert = true
                    }
                    
                } label: {
                    
                    
                    Text("Sing Up ")
                        .font(.normalTextBold)
                        .frame(height: 55)
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
                
                HStack {
                    VStack { Divider() }.padding(.horizontal, 30)
                    Text("Or Sign in With")
                        .font(.smallTextRegular)
                        .foregroundStyle(Color(.gray4))
                    VStack { Divider() }.padding(.horizontal, 30)
                }
                
                HStack {
                    Image("google")
                        .padding()
                    Image("facebook")
                        .padding()
                }
                HStack {
                    Text("Already a member?")
                        .font(.smallTextRegular)
                    
                    
                    Button {
                        //Destination
                        
                        dismiss()
                        
                    } label: {
                        Text("Sign In")
                            .foregroundStyle(.secondary100)
                        
                    }
                    
                    
                }
                
                .padding(.bottom)
                
                NavigationLink(destination: TabBarView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        
        
        
        
    }
    func validateFields() -> Bool {
        if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || !isAccepted {
            alertMessage = "Please fill in all fields and accept the terms."
            return false
        }
        // nspredicate = sorgu yapmak için filtreler
        let emailRegex = NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}$")
        // evaluate(with) = filtrelenmiş küme ile yazı eşleşiyor mu diye kontrol eder
        if !emailRegex.evaluate(with: email) {
            alertMessage = "Please enter a valid email address."
            return false
        }
        
        if password.count < 8 || !password.contains(where: { $0.isUppercase }) {
            alertMessage = "Password must be at least 8 characters long and contain at least one uppercase letter."
            return false
        }
        
        if password != confirmPassword {
            alertMessage = "Passwords do not match."
            return false
        }
        
        return true
    }
}

#Preview {
    SignUpView()
}
