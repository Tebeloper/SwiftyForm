//
//  InfoViewViewModel.swift
//  SwiftyForm
//
//  Created by Dimitris Gkarlemos on 29/08/2023.
//

import Foundation

enum InfoViewOptions: CaseIterable {
    case linkedin
    case github
    case twitter
    case reddit
    
    var targetURL: URL? {
        switch self {
        case .linkedin:
            return URL(string: "https://www.linkedin.com/in/dimitris-gkarlemos")
        case .github:
            return URL(string: "https://github.com/Tebeloper")
        case .twitter:
            return URL(string: "https://twitter.com/tebeloper")
        case .reddit:
            return URL(string: "https://www.reddit.com/user/Tebeloper")
        }
    }
}
