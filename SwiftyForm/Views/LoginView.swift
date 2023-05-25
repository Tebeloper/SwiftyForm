//
//  LoginView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var borderColor: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // MARK: - Image && Text
                    Image("LoginScreen")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text("Hello Again!")
                        .font(.system(size: 50))
                        .bold()
                    Text("Welcome back you've been missed!")
                        .font(.subheadline)
                    
                    // MARK: - Form
                    VStack {
                        HStack {
                            Image(systemName: "person")
                            TextField("Username...", text: $username)
                                .padding()
                                .autocorrectionDisabled()
                                .frame(width: 300)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(10)
                            
                            // Unnecessary Button
                            Button {
                                isSecure.toggle()
                            } label: {
                                Image(systemName: "eye")
                                    .foregroundColor(.black)
                            }
                            .hidden()
                            
                        } //:HStack
                        HStack {
                            Image(systemName: "key")
                            if isSecure {
                                SecureField("Password...", text: $password)
                                    .padding()
                                    .autocorrectionDisabled()
                                    .frame(width: 300)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(borderColor))
                            } else {
                                TextField("Password...", text: $password)
                                    .padding()
                                    .autocorrectionDisabled()
                                    .frame(width: 300)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(borderColor))
                            }
                            
                            Button {
                                isSecure.toggle()
                            } label: {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.white)
                            }
                            .opacity(password.isEmpty ? 0 : 1)
                        } //:HStack
                        
                        // MARK: - Forgot Password
                        Button("Forgot Password") {
                            print("Not functional yet...")
                        }
                        .padding()
                        
                        Spacer()
                        
                        // MARK: - Log In Button Component
                        SFButton(title: "Log In") {
                            print("fewfwewe")
                        }
                    } //: Form VStack
                    
                    // MARK: - Don't have an account?
                    HStack {
                        Text("Don't have an account?")
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Register")
                        }
                    } // :HStack
                } //: Main VStack
            } //:ZStack
        } //:NavigationStack
        .navigationBarBackButtonHidden()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
