//
//  IArticlesDataObject.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import Foundation

protocol IArticlesDataObject {
    var numberOfCategories: Int {get}
    var categories: [ArticleCategory] {get set}
    
    func getArticle(by indexPath: IndexPath) -> Article
}
