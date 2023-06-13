//
//  LoginViewViewModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isSecure: Bool = true
    @Published var borderColor: CGFloat = 0
    @Published var readyToNavigate: Bool = false
    
    @Published var isAuthenticated: Bool = false
    
    func performLogin() {
        
        let defaults = UserDefaults.standard
        
        LoginService().performLogin(username: username, password: password) { result in
            switch result {
            case .success(let loginResponse):
                defaults.setValue(loginResponse.access_token, forKey: "token")
                defaults.setValue(loginResponse.refresh_token, forKey: "refreshToken")
                defaults.setValue(loginResponse.expires_at, forKey: "expiresAt")
                
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.readyToNavigate = true
                }
                
                
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                    print("Error: \(error)")
                }
            }
        }
    }
}
