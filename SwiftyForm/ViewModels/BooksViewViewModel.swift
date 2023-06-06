//
//  BooksViewViewModel.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import Foundation

class BooksViewViewModel: ObservableObject {
    
    func getBooks() {
        
        let defaults = UserDefaults.standard
        
        guard let accessToken = defaults.string(forKey: "token") else {
            return
        }
        
        BooksService().getBooks(accessToken: accessToken) { result in
            switch result {
            case .success(let books):
                print("Successfully got the books: \(books)")
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
