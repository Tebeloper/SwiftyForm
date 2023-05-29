//
//  LoginView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    
    
    @StateObject private var viewModel = LoginViewViewModel()
    
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
                            TextField("Username...", text: $viewModel.username)
                                .padding()
                                .autocorrectionDisabled()
                                .frame(width: 300)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(10)
                                .autocapitalization(.none)
                            
                            // Unnecessary Button
                            Button {
                                viewModel.isSecure.toggle()
                            } label: {
                                Image(systemName: "eye")
                                    .foregroundColor(.black)
                            }
                            .hidden()
                            
                        } //:HStack
                        HStack {
                            Image(systemName: "key")
                            if viewModel.isSecure {
                                SecureField("Password...", text: $viewModel.password)
                                    .padding()
                                    .autocorrectionDisabled()
                                    .frame(width: 300)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(viewModel.borderColor))
                            } else {
                                TextField("Password...", text: $viewModel.password)
                                    .padding()
                                    .autocorrectionDisabled()
                                    .frame(width: 300)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(viewModel.borderColor))
                            }
                            
                            Button {
                                viewModel.isSecure.toggle()
                            } label: {
                                Image(systemName: viewModel.isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.white)
                            }
                            .opacity(viewModel.password.isEmpty ? 0 : 1)
                        } //:HStack
                        
                        if viewModel.isAuthenticated == false {
                            Text("The Username or Password you entered are incorrect")
                                .foregroundColor(.red)
                        }
                        
                        // MARK: - Forgot Password
                        Button("Forgot Password") {
                            print("Not functional yet...")
                        }
                        .padding()
                        
                        Spacer()
                        
                        // MARK: - Log In Button Component
                        SFButton(title: "Log In") {
                            viewModel.performLogin()
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
