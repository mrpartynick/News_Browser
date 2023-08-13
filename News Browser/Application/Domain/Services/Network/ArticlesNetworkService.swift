//
//  NetworkService.swift
//  News Browser
//
//  Created by Николай Циминтия on 08.08.2023.
//

import Foundation

//MARK: - protocol
protocol IArticlesNetworkService {
    func getArticlesByCategories(completion: @escaping (Result<[Data], Error>)->())
}

//MARK: - realization
class ArticlesNetworkService: IArticlesNetworkService {
    private let _taskGroup = DispatchGroup()
    private let _provider: IURLProvider = URLProvider()
    private let _categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    //MARK: - get articles
    public func getArticlesByCategories(completion: @escaping (Result<[Data], Error>)->()) {
        
        let categoriesURLS = _provider.provideURL(for: _categories)
        let session = URLSession.shared
        var dataArray = [Data]()
        
        for url in categoriesURLS {
            _taskGroup.enter()
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { data, response, error in
                defer {self._taskGroup.leave()}
                guard let data = data else {return}
                dataArray.append(data)
            }
            task.resume()
        }
        
        _taskGroup.notify(queue: DispatchQueue.global(qos: .default)) {
            
            if dataArray.isEmpty {
                completion(.failure(RequestError.ReqError))
            } else {
                completion(.success(dataArray))
            }
            
            print("All tasks completed")
            print(dataArray.count)
        }
    }
}
