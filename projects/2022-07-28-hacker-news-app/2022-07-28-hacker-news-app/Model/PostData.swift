//
//  PostData.swift
//  2022-07-28-hacker-news-app
//
//  Created by JUNHYUN KANG on 2022/07/28.
//

import Foundation

struct Results: Codable {
    
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    // computed option
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
