//
//  ContentView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import SwiftUI

struct MainView: View {
    
    @State private var showingSheet: Bool = false
    
    // An instance for Haptic Feedback Notifications
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("MainScreen")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(70)
                
                Text("Welcome to")
                    .font(.largeTitle)
                    .frame(alignment: .center)
                
                Text("SwiftyForm")
                    .font(.system(size:50))
                    .fontWeight(.black)
                    .foregroundStyle(
                        LinearGradient(colors: [.red,
                                                .purple
                                                
                        ],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                
                Spacer()
                
                HStack {
                    Button {
                        showingSheet = true
                        hapticFeedback.notificationOccurred(.success)
                    } label: {
                        Text("Register")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .sheet(isPresented: $showingSheet) {
                        RegisterView()
                    }
                    
                    Text("|")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    
                } //:HStack
                .background(
                    Capsule()
                        .foregroundStyle(
                            LinearGradient(colors: [.red,
                                                    .purple,
                            ],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                )
                .padding()
            } //:VStack
        } //:NavigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
