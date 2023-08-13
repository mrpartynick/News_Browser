//
//  Presenter.swift
//  News Browser
//
//  Created by Николай Циминтия on 07.08.2023.
//

import Foundation

//MARK: - view out
protocol IArticlesListViewOutput: AnyObject {
    func viewDidLoad()
}

//MARK: - interactor out
protocol IArticlesListInteractorOutput: AnyObject {
    func showArticles(articles: IArticlesDataObject, withError: Bool)
}

//MARK: - Realization
class ArticlesListPresenter: IArticlesListViewOutput {
    public weak var view: IArticlesListView? = nil
    public var interactor: IArticlesInteractor!
    
    init(interactor: IArticlesInteractor) {
        self.interactor = interactor
    }
    
    public func viewDidLoad() {
        interactor?.getNewsByCategories()
    }
}

extension ArticlesListPresenter: IArticlesListInteractorOutput {
    func showArticles(articles: IArticlesDataObject, withError: Bool) {
        DispatchQueue.main.async {
            if withError {
                self.view?.showAlert()
            }
            
            self.view?.showArticles(from: articles)
        }
    }
    
}
