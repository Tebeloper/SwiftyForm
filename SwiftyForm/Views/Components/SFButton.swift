//
//  SFButton.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 25/05/2023.
//

import SwiftUI

struct SFButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action,
               label: {
            Text(title)
        })
        .foregroundColor(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150)
                .foregroundStyle(
                    LinearGradient(colors: [.blue,
                                            .gray,
                                            .orange
                    ],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
        )
        .padding()
    }
}

struct SFButton_Previews: PreviewProvider {
    static var previews: some View {
        SFButton(title: "SFButton",
                 action: {
            print("SFButton")
        })
    }
}
