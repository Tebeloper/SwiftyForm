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
    @Published var passwordsMatch: Bool = true
    @Published var isSecure: Bool = true
    @Published var borderColor: CGFloat = 0
    
    func PerformRegister() {
        if password != confirmedPassword {
            borderColor = 0.5
            confirmedPassword = ""
            password = ""
            passwordsMatch = false
        } else {
            passwordsMatch = true
            borderColor = 0
        }
    }
}
