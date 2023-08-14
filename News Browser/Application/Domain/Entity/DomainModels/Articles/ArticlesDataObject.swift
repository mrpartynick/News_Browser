//
//  ArticlesDataObject.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import Foundation

class ArticlesDataObject: IArticlesDataObject {

    
    var numberOfCategories: Int {
        get {
            _categories.count
        }
    }
    
    var categories: [ArticleCategory] {
        get {
            return _categories
        }
        
        set {
            _categories = newValue
        }
    }
    
    private var _categories: [ArticleCategory] = [ArticleCategory]()
    
    public func getArticle(by indexPath: IndexPath) -> Article {
        let categoryIndex = indexPath.section
        let articleIndex = indexPath.item
        let article = _categories[categoryIndex].articles[articleIndex]
        
        return article
    }
    
}
