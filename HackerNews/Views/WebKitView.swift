//
//  WebKitView.swift
//  HackerNews
//
//  Created by Devasurya on 06/03/24.
//

import Foundation
import SwiftUI
import WebKit

// UIViewrepresentable protocoal - Allows us to create a  swiftUI view  that represents a UIKIt view.
struct WebView: UIViewRepresentable {
    
    /// Variable decalarations
    let urlValue: String?
    
    /// makeUIView - > Once this method is called  uikitwebview  and turn into swiftUI webview.
    /// - Parameter context: Type alias of uiviewrepresentableContext.
    /// - Returns: A webview in swifftUI.
    func makeUIView(context: Context) ->  WebView.UIViewType {
        return WKWebView()
    }
    
    /// updateUIView - This is function which  update the view where we have to pass the URL , there a request is passed to  render the data from the URL.
    /// - Parameters:
    ///   - uiView: WKWebView
    ///   - context: Type alias of uiviewrepresentableContext.
    func updateUIView(_ uiView:WKWebView, context: Context) {
        if let safeString = urlValue {
            if let url = URL(string: safeString) {
                let request =  URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
