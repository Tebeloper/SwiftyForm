//
//  Register.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 25/05/2023.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case NetworkError
}

struct RegisterUser: Codable {
    let username: String
    let password: String
}

struct RegisterResponse: Codable {
    
}

class RegisterService {
    
    func performRegister(username: String, password: String, completion: @escaping (Result<RegisterResponse, AuthenticationError>) -> Void) {
        
        let registerCredentials = RegisterUser(username: username, password: password)
        
        guard let url = URL(string: "http://localhost:3000/register") else {
            completion(.failure(.NetworkError))
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
                
                guard let data = data, error == nil else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                guard let registerResponse = try? JSONDecoder().decode(RegisterResponse.self, from: data) else {
                    completion(.failure(.NetworkError))
                    return
                }
                
                completion(.success(registerResponse))
                
            case 401:
                completion(.failure(.invalidCredentials))
            default:
                completion(.failure(.NetworkError))
            }
        }.resume()
    }
}
