//
//  ContentView.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 24/05/2023.
//

import SwiftUI
import Lottie

struct MainView: View {
    
    @State private var showingRegisterSheet: Bool = false
    @State private var showingLoginSheet: Bool = false
    
    
    // An instance for Haptic Feedback Notifications
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .padding(100)
                    .foregroundStyle(
                        LinearGradient(colors: [.blue,
                                                .gray,
                                                .orange
                        ],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                
                Text("Welcome to")
                    .font(.largeTitle)
                    .frame(alignment: .center)
                
                Text("SwiftyForm")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(
                        LinearGradient(colors: [.blue,
                                                .gray,
                                                .orange
                        ],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                
                Spacer()
                
                HStack {
                    Button {
                        showingRegisterSheet = true
                        hapticFeedback.notificationOccurred(.success)
                    } label: {
                        Text("Register")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .sheet(isPresented: $showingRegisterSheet) {
                        RegisterView()
                    }
                    
                    Text("|")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    Button {
                        showingLoginSheet = true
                        hapticFeedback.notificationOccurred(.success)
                    } label: {
                        Text("Login")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .sheet(isPresented: $showingLoginSheet) {
                        LoginView()
                    }
                    
                } //:HStack
                .padding()
                .background(
                    Capsule()
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
                
            } //:VStack
        } //:NavigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
