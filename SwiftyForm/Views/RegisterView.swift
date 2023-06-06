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
        NavigationView {
            VStack {
                
                // MARK: - Image && Text
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
                    
                    // Username HStack
                    HStack {
                        Image(systemName: "person")
                        TextField("Username...", text: $viewModel.username)
                            .styleRegisterViewTextField()
                        
                        // useless button
                        Button {
                            viewModel.passwordIsSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.passwordIsSecure ? "eye.slash" : "eye")
                                .foregroundColor(.black)
                        }
                        .hidden()
                        
                    } //:Username HStack
                    
                    // Password HStack
                    HStack {
                        Image(systemName: "lock")
                        if viewModel.passwordIsSecure {
                            SecureField("Password...", text: $viewModel.password)
                                .styleRegisterViewSecureField()
                            
                            //making the border red with the same Corner Radius
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                                )
                        } else {
                            TextField("Password...", text: $viewModel.password)
                                .styleRegisterViewTextField()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                                )
                        }
                        
                        Button {
                            viewModel.passwordIsSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.passwordIsSecure ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                        .opacity(viewModel.password.isEmpty ? 0 : 1)
                    } //:Password HStack
                    
                    // Confirmed Password HStack
                    HStack {
                        Image(systemName: "lock")
                        if viewModel.confirmedPasswordIsSecure {
                            SecureField("Confirm Password...", text: $viewModel.confirmedPassword)
                                .styleRegisterViewSecureField()
                            
                            //making the border red with the same Corner Radius
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                                )
                        } else {
                            TextField("Password...", text: $viewModel.confirmedPassword)
                                .styleRegisterViewTextField()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: CGFloat(viewModel.borderColor))
                                )
                        }
                        
                        Button {
                            viewModel.confirmedPasswordIsSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.confirmedPasswordIsSecure ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                        .opacity(viewModel.confirmedPassword.isEmpty ? 0 : 1)
                    } //:Confirmed Password HStack
                    
                    Text(viewModel.passwordsMatch ? "" : viewModel.errorMessage)
                        .foregroundColor(.red)
                                        
                } //:Form VStack
                
                Spacer()
                
                // MARK: - Register Button Component
                SFButton(title: "Register") {
                    viewModel.PerformRegister()
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("User successfully created!"),
                          message: Text("Please Log In"),
                          dismissButton: .default(Text("OK"), action: {
                    })
                    )
                }
                
                // MARK: - Already have an account?
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                    }
                } //:Already have an account? HStack
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

