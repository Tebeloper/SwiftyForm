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
            
            HStack {
                Image("GitHub")
            }
            
            Spacer()
        } //:VStack
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
