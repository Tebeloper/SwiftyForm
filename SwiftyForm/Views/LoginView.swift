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
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("LoginScreen")
                        .resizable()
                        .scaledToFit()
                        .padding()
                                        
                    Text("Hello Again!")
                        .font(.system(size: 50))
                        .bold()
                    Text("Welcome back you've been missed!")
                        .font(.subheadline)
                    Form {
                        HStack {
                            Image(systemName: "person")
                            TextField("Username", text: $username)
                        }
                        HStack {
                            Image(systemName: "key")
                            if isSecure {
                                SecureField("Password", text: $password)
                            } else {
                                TextField("Password", text: $password)
                            }
                            
                            Spacer()
                            
                            Button {
                                isSecure.toggle()
                            } label: {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.white)
                            }
                            .opacity(password.isEmpty ? 0 : 1)
                        } //:HStack
                    } //:Form
                    .scrollContentBackground(.visible)
                    Button("Log In") {
                        
                    }
                    .padding()
                    .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                    )
                } //:VStack
            } //:ZStack
        } //:NavigationStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
