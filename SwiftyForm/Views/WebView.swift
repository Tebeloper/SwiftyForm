//
//  WebView.swift
//  SwiftyForm
//
//  Created by Dimitris Gkarlemos on 06/09/2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    
    var url:String
    
    
    func makeUIView(context: Context) -> some UIView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
