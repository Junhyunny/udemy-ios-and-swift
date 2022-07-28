//
//  NetworkingManager.swift
//  2022-07-28-hacker-news-app
//
//  Created by JUNHYUN KANG on 2022/07/28.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) {
                (data, urlResponse, error) in
                if let err = error {
                    print(err)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
