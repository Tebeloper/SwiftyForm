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
    
    func getBooks(accessToken: String, completion: @escaping (Result<[BookResponse], GetBooksAuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3000/books") else {
            completion(.failure(.custom(errorMessage: "Error occurred on EndPoint!")))
            return
        }
        
        var request = URLRequest(url: url)
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
                dump("dump")
            default:
                dump(String(data: data, encoding: .utf8))
            }
        }.resume()
    }
}
