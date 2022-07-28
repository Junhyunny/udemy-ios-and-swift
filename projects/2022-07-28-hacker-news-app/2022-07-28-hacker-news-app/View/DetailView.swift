//
//  DetailView.swift
//  2022-07-28-hacker-news-app
//
//  Created by JUNHYUN KANG on 2022/07/28.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

