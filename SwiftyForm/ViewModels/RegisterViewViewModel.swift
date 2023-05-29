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
    
    @Published var isSecure: Bool = true
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
            RegisterService().performRegister(username: username, password: password)
            borderColor = 0
            
            DispatchQueue.main.async {
                self.showAlert = true
            }
        }
    }
}
