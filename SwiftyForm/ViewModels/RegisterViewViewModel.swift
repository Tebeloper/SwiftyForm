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
    @Published var isSecure: Bool = true
    @Published var borderColor: CGFloat = 0
    
    func validate() {
        if password != confirmedPassword {
            borderColor = 0.5
            confirmedPassword = ""
            password = ""
        } else {
            borderColor = 0
        }
    }
}
