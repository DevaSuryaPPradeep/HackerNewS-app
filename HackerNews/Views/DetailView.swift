//
//  DetailView.swift
//  HackerNews
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI

struct DetailView: View {
    
    /// Variable Declarations
    let url: String?
    
    var body: some View {
        WebView(urlValue: url)
    }
}

#Preview {
    DetailView(url: "htttps://www.google.com")
}

