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
    @Published var isPasswordValid: Bool = true
    
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
            borderColor = 0.5
            passwordsMatch = false
            errorMessage = "Passwords don't match."
            return
        }
        
        guard password.count >= 8 else {
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
    
    //Regx
    //    func isValidPassword() -> Bool {
    //        // least one uppercase,
    //        // least one digit
    //        // least one lowercase
    //        // least one symbol
    //        //  min 8 characters total
    //        let password = password.trimmingCharacters(in: CharacterSet.whitespaces)
    //        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
    //        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
    //        return passwordCheck.evaluate(with: password)
    //
    //    }
}
