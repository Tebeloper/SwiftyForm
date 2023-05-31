//
//  BookModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 29/05/2023.
//

import Foundation

struct BookModel: Codable {
    let title: String
    let description: String
    let pages: Int
    let releaseYear: Int
}

class BooksService {
    
    func getBooks(accessToken: String) {
        
        guard let url = URL(string: "http://localhost:3000/books") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
           
            guard let data = data, error == nil else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            guard let books = try? JSONDecoder().decode([BookModel].self, from: data) else {
                return
            }
            
            print(books)
            
        }.resume()
    }
}
