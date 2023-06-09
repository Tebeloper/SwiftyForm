//
//  RegisterModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 25/05/2023.
//

import Foundation

struct RegisterUser:  Codable {
    let username: String
    let password: String
}

class RegisterService {
    
    func performRegister(username: String, password: String) {
        
        let registerCredentials = RegisterUser(username: username, password: password)
        
        guard let url = URL(string: "http://localhost:3000/register") else {
            print("Error occurred on EndPoint!")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(registerCredentials)
        
    }
}

