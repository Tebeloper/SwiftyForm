//
//  TabView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 12/06/2023.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            
            MainView()
                .tabItem {
                    Label("Main", systemImage: "person")
                }
            
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
