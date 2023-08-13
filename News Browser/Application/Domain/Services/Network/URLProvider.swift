//
//  URLConstructor.swift
//  GORA News
//
//  Created by Николай Циминтия on 21.07.2023.
//

import Foundation

protocol IURLProvider {
    func provideURL(for categories: [String]) -> [URL]
}

struct URLProvider: IURLProvider {
    private let basePath = "https://newsapi.org/v2/top-headlines?category="
    private let key = "18f8e8960e264c51974972daed1e68d2"
    
    public func provideURL(for categories: [String]) -> [URL] {
        var urlArray = [URL]()
        
        for category in categories {
            let pathForCategory = basePath + category + "&apiKey=" + key
            let urlForCategory = URL(string: pathForCategory)!
            urlArray.append(urlForCategory)
        }
        
        return urlArray
    }
    
}
