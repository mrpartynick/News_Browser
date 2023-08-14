//
//  ArticlesFactory.swift
//  News Browser
//
//  Created by Николай Циминтия on 05.08.2023.
//

import UIKit

typealias Kek = UIViewController & IArticlesModuleController

class ArticlesFactory {
    
    public func getListModule() -> ArticlesListView {
        return ArticlesListAssembly.getModule()
    }
    
    public func getDetailedModule() -> DetailedArticleView {
        return DetailedArticleView(article: nil)
    }

}
