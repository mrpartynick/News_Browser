//
//  ArticlesListAssembly.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import UIKit

class ArticlesListAssembly {
    public static func getModule() -> ArticlesListView {
        let interactor = ArticlesListInteractor()
        let presenter = ArticlesListPresenter(interactor: interactor)
        let controller = ArticlesListView(presenter: presenter)

        presenter.view = controller
        interactor.presenter = presenter

        return controller
    }
}
