//
//  RegisterView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image("RegisterScreen")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Text("Hello World!")
                    .font(.system(size: 50))
                    .bold()
                Text("We are glad to see you :)")
                    .font(.subheadline)
                
                // MARK: - Form
                VStack {
                    HStack {
                        Image(systemName: "person")
                        TextField("Username...", text: $viewModel.username)
                            .padding()
                            .frame(width: 300)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                        
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
                        Image(systemName: "lock")
                        if viewModel.isSecure {
                            SecureField("Password...", text: $viewModel.password)
                                .padding()
                                .frame(width: 300)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(10)
                            
                            //making the border red with the same Corner Radius
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                                )
                        } else {
                            TextField("Password...", text: $viewModel.password)
                                .padding()
                                .frame(width: 300)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                                )
                        }
                        
                        Button {
                            viewModel.isSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                        .opacity(viewModel.password.isEmpty ? 0 : 1)
                    } //:HStack
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Confirm Password...", text: $viewModel.confirmedPassword)
                            .padding()
                            .frame(width: 300)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                            )
                        // Unnecessary Button
                        Button {
                            viewModel.isSecure.toggle()
                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(.black)
                        }
                        .hidden()
                    }
                    
                    if !viewModel.passwordsMatch {
                        Text("Passwords don't match")
                            .foregroundColor(.red)
                    }
                } //:Form VStack
                
                Spacer()
                
                // MARK: - Register Button Component
                SFButton(title: "Register") {
                    
                    viewModel.PerformRegister()
                }
                
                // MARK: - Already have an account?
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                    }
                } //:HStack
            } //: Main VStack
        } //:NavigationStack
        .navigationBarBackButtonHidden()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

