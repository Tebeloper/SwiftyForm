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

struct RegisterUser {
    let username: String
    let password: String
}

struct RegisterResponse {
    
}

class RegisterService {
    
    func performRegister(username: String, password: String, completion: @escaping (Result<RegisterResponse, AuthenticationError>) -> Void) {
        
        let registerCredentials = RegisterUser(username: username, password: password)
        
        guard let url = URL(string: "") else {
            completion(.failure(.NetworkError))
            return
        }
        
    }
}
