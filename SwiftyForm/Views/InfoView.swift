//
//  InfoView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 12/06/2023.
//

import SwiftUI
import WebKit

struct InfoView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("me")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .background(Color.black)
                    .clipShape(Circle())
                
                Text("iOS Developer")
                    .font(.largeTitle)
                    .bold()
                HStack(spacing: 16) {
                    NavigationLink {
                        WebView(url: "https://github.com/Tebeloper")
                    } label: {
                        Image("github")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    NavigationLink {
                        WebView(url: "https://www.linkedin.com/in/dimitris-gkarlemos/")
                    } label: {
                        Image("linkedin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    NavigationLink {
                        WebView(url: "https://twitter.com/tebeloper")
                    } label: {
                        Image("x")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                } //:HStack
                
                Spacer()
                
                HStack{
                    Text("Thank You!")
                        .foregroundColor(Color("myColor"))
                        .font(.largeTitle)
                    Text("❤️")
                        .font(.largeTitle)
                } //:HStack
                Spacer()
            } //:VStack
        } //:NavigationStack
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
