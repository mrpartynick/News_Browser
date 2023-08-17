//
//  ArticlesView.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//
import UIKit

//MARK: - view protocol
protocol IArticlesListView: AnyObject {
    func showAlert()
    func showArticles(from dataObject: IArticlesDataObject)
}

class ArticlesListView: BaseArticlesViewController, IArticlesListView {
    
    private var _completion: ((Article) -> ())?
    private let _searchController = UISearchController()
    public var presenter: IArticlesListViewOutput!
    
    //MARK: - init
    init(presenter: IArticlesListViewOutput) {
        self.presenter = presenter
        super.init()
        
        navigationItem.searchController = _searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = R.NavItemTitles.articleListTitle
                
        collectionView.reloadData()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    
    //MARK: - show alert
    public func showAlert() {
        let badConnectionAlert = UIAlertController(title: R.AlertStrings.BadConnection.title, message: R.AlertStrings.BadConnection.message, preferredStyle: .alert)
        badConnectionAlert.addAction(UIAlertAction(title: R.AlertStrings.BadConnection.actionTitle, style: .default))
        present(badConnectionAlert, animated: true)
    }
    
    //MARK: - show articles
    public func showArticles(from dataObject: IArticlesDataObject) {
        self.dataObject = dataObject
        state = .Showing
    }
}

//MARK: - collection view delegate
extension ArticlesListView {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let article = dataObject?.getArticle(by: indexPath),
              let comp = _completion else {return}
        comp(article)
    }
}

//MARK: - Coordinator protocol
extension ArticlesListView: IArticlesModuleController {
    
    typealias T = Article
    
    var completion: ((T) -> ())? {
        get {
            return _completion
        }
        set {
            _completion = newValue
        }
    }
}
