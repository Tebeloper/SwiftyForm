//
//  BooksView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import SwiftUI

struct BooksView: View {
    
    @StateObject var viewModel = BooksViewViewModel()
    
    var body: some View {
        NavigationView {
            Text("Hello World!")
        }
        .onAppear {
            viewModel.getBooks()
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
