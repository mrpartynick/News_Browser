//
//  ArticlesListInteractor.swift
//  News Browser
//
//  Created by Николай Циминтия on 08.08.2023.
//

import Foundation

//MARK: - Protocol
protocol IArticlesInteractor: AnyObject {
    func getNewsByCategories()
}

// Написать парсер и кэшер. Парсят и кэшат - разные сущности?

//MARK: - realization
class ArticlesListInteractor: IArticlesInteractor {
    public weak var presenter: IArticlesListInteractorOutput?
    
    private let networkService: IArticlesNetworkService = ArticlesNetworkService()
    private let dataHandler = DataHandler()
    private let cacheService = FileCahceService()
    
    //MARK: - get news by categories
    public func getNewsByCategories() {
        networkService.getArticlesByCategories {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                do {
                    try cacheService.saveData(data: data)
                    let parsedData = try self.dataHandler.parseArticles(from: data)
                    let domainData = dataHandler.convertParsedArticlesToDomainModel(from: parsedData)
                    presenter?.showArticles(articles: domainData, withError: false)
                } catch {
                    print(error)
                }
            case .failure(_):
                guard let dataFromCache = try? cacheService.loadData() else {return}
                guard let parsedData = try? self.dataHandler.parseArticles(from: dataFromCache) else {return}
                let domainData = dataHandler.convertParsedArticlesToDomainModel(from: parsedData)
                presenter?.showArticles(articles: domainData, withError: true)
            }
        }
    }
    
    
}
