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
                
                // MARK: - Form
                TextField("Username...", text: $viewModel.username)
                    .padding()
                    .frame(width: 300)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                if viewModel.isSecure {
                    SecureField("Password...", text: $viewModel.password)
                        .padding()
                        .frame(width: 300)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(viewModel.borderColor))
                    
                    SecureField("Confirm Password...", text: $viewModel.confirmedPassword)
                        .padding()
                        .frame(width: 300)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(viewModel.borderColor))
                } else {
                    TextField("Password...", text: $viewModel.password)
                        .padding()
                        .frame(width: 300)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(viewModel.borderColor))
                    
                    TextField("Confirm Password...", text: $viewModel.confirmedPassword)
                        .padding()
                        .frame(width: 300)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(viewModel.borderColor))
                }
                
                // MARK: - Register Button
                Button("Register") {
                    print("Register")
                    viewModel.validate()
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150)
                        .foregroundStyle(
                            LinearGradient(colors: [.blue,
                                                    .gray,
                                                    .orange
                            ],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                )
                .padding()
                
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
