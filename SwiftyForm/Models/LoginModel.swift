//
//  LoginModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 25/05/2023.
//

import Foundation

enum LoginAuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginUser: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let access_token: String
    let refresh_token: String
    let expires_at: String
}

class LoginService {
    
    func performLogin(username: String, password: String, completion: @escaping (Result<LoginResponse, LoginAuthenticationError>) -> Void) {
        
        let loginCredentials = LoginUser(username: username, password: password)
        
        guard let url = URL(string: "http://localhost:3000/login") else {
            completion(.failure(.custom(errorMessage: "Error occurred on EndPoint!")))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginCredentials)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            switch httpResponse.statusCode {
            case 200:
                
                guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data!) else {
                    completion(.failure(.custom(errorMessage: "Unable to decode the data: \(String(describing: error))")))
                    return
                }
                completion(.success(loginResponse))
                
            case 401:
                completion(.failure(.invalidCredentials))
            default:
                completion(.failure(.custom(errorMessage: "Unknown response code: \(httpResponse.statusCode)")))
            }
        }.resume()
    }
}
