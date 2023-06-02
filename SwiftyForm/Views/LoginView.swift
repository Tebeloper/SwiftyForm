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
        NavigationView {
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
                        
                        // Username HStack
                        HStack {
                            Image(systemName: "person")
                            TextField("Username...", text: $viewModel.username)
                                .styleLoginViewTextField()
                            
                            // Unnecessary Button
                            Button {
                                viewModel.isSecure.toggle()
                            } label: {
                                Image(systemName: "eye")
                                    .foregroundColor(.black)
                            }
                            .hidden()
                            
                        } //:Username HStack
                        
                        // Password HStack
                        HStack {
                            Image(systemName: "key")
                            if viewModel.isSecure {
                                SecureField("Password...", text: $viewModel.password)
                                    .styleLoginViewSecureField()
                                    .border(.red, width: CGFloat(viewModel.borderColor))
                                
                            } else {
                                TextField("Password...", text: $viewModel.password)
                                    .styleLoginViewTextField()
                                    .border(.red, width: CGFloat(viewModel.borderColor))
                            }
                            
                            Button {
                                viewModel.isSecure.toggle()
                                
                            } label: {
                                Image(systemName: viewModel.isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.white)
                            }
                            .opacity(viewModel.password.isEmpty ? 0 : 1)
                        } //:Password HStack
                        
                        Text(viewModel.isAuthenticated ? "" : "The Username or Password you entered are incorrect")
                            .foregroundColor(.red)
                            .frame(alignment: .center)
                        
                        // MARK: - Forgot Password
                        Button("Forgot Password") {
                            print("Not functional yet...")
                        }
                        .padding()
                        
                        Spacer()
                        
                        // MARK: - Log In Button Component
                        NavigationLink(destination: BooksView()) {
                            SFButton(title: "Log In") {
                                viewModel.performLogin()
                            }
                        }
                    } //: Form VStack
                    
                    // MARK: - Don't have an account?
                    HStack {
                        Text("Don't have an account?")
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Register")
                        }
                    } // :Don't have an account? HStack
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
