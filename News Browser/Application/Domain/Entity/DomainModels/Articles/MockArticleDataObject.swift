//
//  MockArticleDataObject.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import Foundation

struct MockArticleDataObject: IArticlesDataObject {
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
    
    private var _categories: [ArticleCategory] = []
    
    init() {
        for categoryCount in 0...20 {
            var category = ArticleCategory(articles: [Article]())
            
            for articleCount in 0...10 {
                let article = Article(title: "", urlToArticle: "")
                category.articles.append(article)
            }
            
            _categories.append(category)
        }
    }
    

    
    public func getArticle(by indexPath: IndexPath) -> Article {
        let categoryIndex = indexPath.section
        let articleIndex = indexPath.item
        let article = _categories[categoryIndex].articles[articleIndex]
        
        return article
    }
}
