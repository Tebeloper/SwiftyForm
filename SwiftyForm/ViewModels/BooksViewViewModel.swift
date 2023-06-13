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
        
        guard var accessToken = defaults.string(forKey: "token") else {
            return
        }
        
        guard var refreshedAccessToken = defaults.string(forKey: "refreshToken") else {
            return
        }
        
        guard var expiresAt = defaults.string(forKey: "expiresAt") else {
            return
        }
        
        if !isDateValid(date: expiresAt) {
            BooksService().refreshToken(refreshToken: refreshedAccessToken) { result in
                switch result {
                case .success(let refreshResponse):
                    
                    accessToken = refreshResponse.access_token
                    refreshedAccessToken = refreshResponse.refresh_token
                    expiresAt = refreshResponse.expires_at
                    
                    defaults.setValue(refreshResponse.access_token, forKey: "token")
                    defaults.setValue(refreshResponse.refresh_token, forKey: "refreshToken")
                    defaults.setValue(refreshResponse.expires_at, forKey: "expiresAt")
                    
                    dump(refreshResponse)
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        BooksService().getBooks(accessToken: accessToken) { result in
            switch result {
            case .success(_):
                print("Successfully got the books!")
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func isDateValid(date: String) -> Bool {
        
        let dateFormatter = ISO8601DateFormatter()
        let targetDateString = date
        
        // Remove fractional seconds from the target date string
        let targetDateStringWithoutFractionalSeconds = targetDateString.replacingOccurrences(of: #"(\.\d+)"#, with: "", options: .regularExpression)
        
        // Parse the target date string
        guard let targetDate = dateFormatter.date(from: targetDateStringWithoutFractionalSeconds) else {
            fatalError("Invalid target date format")
        }
        
        // Get the current date and time
        let currentDate = Date()
        
        // Compare the two dates
        let calendar = Calendar.current
        let comparisonResult = calendar.compare(currentDate, to: targetDate, toGranularity: .second)
        
        // Check the comparison result
        if comparisonResult == .orderedAscending {
            return true
        }
        return false
    }
}
