//
//  RegisterViewViewModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    @Published var borderColor: CGFloat = 0
    @Published var errorMessage: String = ""
    
    @Published var passwordIsSecure: Bool = true
    @Published var confirmedPasswordIsSecure: Bool = true
    @Published var passwordsMatch: Bool = true
    @Published var showAlert: Bool = false
    
    func PerformRegister() {
        
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !confirmedPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            borderColor = 0.5
            confirmedPassword = ""
            password = ""
            passwordsMatch = false
            
            errorMessage = "Please fill in all fields."
            
            return
        }
        
        guard password == confirmedPassword else {
            passwordsMatch = false
            borderColor = 0.5
            errorMessage = "Please make sure your passwords match."
            return
        }
        
        guard password.count >= 8,
              confirmedPassword.count >= 8 else {
            borderColor = 0.5
            passwordsMatch = false
            errorMessage = "Please enter a stronger Password!"
            return
        }
        
        RegisterService().performRegister(username: username, password: password)

            passwordsMatch = true
            showAlert = true
        
            borderColor = 0
            username = ""
            password = ""
            confirmedPassword = ""
        
    }
}
