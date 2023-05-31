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
    
    @Published var passwordIsSecure: Bool = true
    @Published var confirmedPasswordIsSecure: Bool = true
    @Published var passwordsMatch: Bool = true
    @Published var showAlert: Bool = false
    
    func PerformRegister() {
        
        if password != confirmedPassword {
            borderColor = 0.5
            confirmedPassword = ""
            password = ""
            passwordsMatch = false
        } else {
            passwordsMatch = true
            showAlert = true
            RegisterService().performRegister(username: username, password: password)
            username = ""
            password = ""
            confirmedPassword = ""
            borderColor = 0
        }
    }
    
    // Regx
//    func isValidPassword(password: String) -> Bool {
//        let password = password.trimmingCharacters(in: .whitespaces)
//        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
//        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
//        return passwordCheck.evaluate(with: password)
//    }
}
