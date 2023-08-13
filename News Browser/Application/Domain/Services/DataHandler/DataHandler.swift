//
//  DataHandler.swift
//  News Browser
//
//  Created by Николай Циминтия on 09.08.2023.
//

import Foundation

protocol IDataHandler {
    func parseArticles(from data: [Data]) -> [NewsCategory]
    func convertParsedArticlesToDomainModel()
}

class DataHandler {
    private let _categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    public func parseArticles(from data: [Data]) throws -> [NewsCategory] {
        let decoder = JSONDecoder()
        var parsedCategories = [NewsCategory]()
        
        for categoryData in data {
            guard let parsedData = try? decoder.decode(NewsCategory.self, from: categoryData) else {
                throw ParsingError.ParsingEr
            }
            
            parsedCategories.append(parsedData)
        }
        
        return parsedCategories
    }
    
    public func convertParsedArticlesToDomainModel(from data: [NewsCategory]) -> IArticlesDataObject {
        var domainDataObject = ArticlesDataObject()
        var categoryIndex = 0
        
        for category in data {
            var domainCategory = ArticleCategory(name: category.categoryName, articles: [Article]())
            domainCategory.name = _categories[categoryIndex]
            categoryIndex += 1
            
            for article in category.articles {
                let title = article.title
                let url = article.url
                let urlToImage = article.urlToImage
                let domainArticle = Article(title: title, urlToArticle: url, urlToImage: urlToImage)
                domainCategory.articles.append(domainArticle)
            }
            
            domainDataObject.categories.append(domainCategory)
        }
        
        return domainDataObject
    }

}
