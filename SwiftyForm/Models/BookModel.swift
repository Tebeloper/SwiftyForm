//
//  BookModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 29/05/2023.
//

import Foundation

enum GetBooksAuthenticationError: Error {
    case expiredToken
    case custom(errorMessage: String)
}

struct RefreshTokenRequest: Codable {
    let refresh_token: String
}

struct RefreshTokenResponse: Codable {
    let access_token: String
    let refresh_token: String
    let expires_at: String
}

struct BookResponse: Codable {
    let title: String
    let description: String
    let pages: Int
    let releaseYear: Int
}

class BooksService {
    let defaults = UserDefaults.standard
    
    // MARK: - GetBooks()
    func getBooks(accessToken: String, completion: @escaping (Result<[BookResponse], GetBooksAuthenticationError>) -> Void) {
        
        guard let getBooksURL = URL(string: "http://localhost:3000/books") else {
            completion(.failure(.custom(errorMessage: "Error occurred on EndPoint!")))
            return
        }
        
        var request = URLRequest(url: getBooksURL)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            guard let books = try? JSONDecoder().decode([BookResponse].self, from: data) else {
                completion(.failure(.custom(errorMessage: "Unable to decode the data: \(String(describing: error))")))
                return
            }
            
            completion(.success(books))
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.expiredToken))
                return
            }
            
            switch httpResponse.statusCode {
            case 401:
                print("dump")
            default:
                dump(books)
            }
        }.resume()
    }
    
    // MARK: - RefreshToken()
    func refreshToken(refreshToken: String, completion: @escaping (Result<RefreshTokenResponse, Error>) -> Void) {
        
        let refreshRequest = RefreshTokenRequest(refresh_token: refreshToken)
        
        guard let refreshURL = URL(string: "http://localhost:3000/refresh_token") else {
            return
        }
        
        var request = URLRequest(url: refreshURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONEncoder().encode(refreshRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            guard let refreshResponse = try? JSONDecoder().decode(RefreshTokenResponse.self, from: data) else {
                return
            }
            
            completion(.success(refreshResponse))
            
        }.resume()
    }
    
}
