//
//  ArticlesCoordinator.swift
//  News Browser
//
//  Created by Николай Циминтия on 05.08.2023.
//

import UIKit

typealias CoordinatorCompletion = () -> ()
typealias ArticleController = IArticlesModuleController & UIViewController

//MARK: - protocol
protocol IArticlesCoordinator: AnyObject {
    var navigationController: UINavigationController {get}
//    var completion: CoordinatorCompletion? {get set}
    func start()
}

//MARK: - realization
class ArticlesCoordinator: IArticlesCoordinator {
    
    var navigationController: UINavigationController {
        get {
            return _navigationController
        }
    }
    
    private var _navigationController = ArticlesNavigationController()
    private let _modulesFactory = ArticlesFactory()
    private var _article: Article? = nil
    
    public func start() {
        _showListModule()
    }
    
    //MARK: - _showListModule
    private func _showListModule() {
        let module = _modulesFactory.getListModule()
        
        module.completion = {[weak self] article in
            guard let self = self else {return}
            self._article = article
            self.showDetailedArticleModule()
        }
        
        navigationController.pushViewController(module, animated: true)
    }
    
    //MARK: - show detailed article module
    private func showDetailedArticleModule() {
        let module = _modulesFactory.getDetailedModule()
        module.article = self._article
        navigationController.pushViewController(module, animated: true)
    }
}
