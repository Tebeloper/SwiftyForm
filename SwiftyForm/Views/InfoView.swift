//
//  InfoView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 12/06/2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
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
                Link(destination: URL(string: "https://github.com/Tebeloper")!) {
                    Image("github")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                Link(destination: URL(string: "https://www.linkedin.com/in/dimitris-gkarlemos/")!) {
                    Image("linkedin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                Link(destination: URL(string: "https://twitter.com/tebeloper")!) {
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
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
