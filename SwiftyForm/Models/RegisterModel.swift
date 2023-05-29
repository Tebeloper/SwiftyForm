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
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(registerCredentials)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            switch httpResponse.statusCode {
            case 200:

                print("User Created")
                
            default:
                print("Error: \(String(describing: error))")
            }
        }.resume()
    }
}

