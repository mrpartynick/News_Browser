//
//  BaseArticlesViewController.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import UIKit

open class BaseArticlesViewController: UICollectionViewController {
    
    internal enum State {
        case Loading
        case Showing
    }
    
    internal var state: State = .Loading {
        didSet {
            collectionView.reloadData()
        }
    }
    
    internal var dataObject: IArticlesDataObject? = MockArticleDataObject()
    internal var cellType = NewsCell.self
    internal var headerType = SectionTitle.self
        
    //MARK: - init
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
        let layout = createLayout()
        collectionView.collectionViewLayout = layout
        baseControllerSetup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidLoad
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - create layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.5), heightDimension: .fractionalHeight(1 / 3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
        section.boundarySupplementaryItems = [createHeader()]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        return .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}

//MARK: - basic functions
@objc public extension BaseArticlesViewController {
    func baseControllerSetup(){
        collectionView.register(cellType.self, forCellWithReuseIdentifier: NewsCell.reuseID)
        collectionView.register(SectionTitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionTitle.id)
        collectionView.register(ShimmerCell.self, forCellWithReuseIdentifier: ShimmerCell.reuseID)
        collectionView.register(ShimmerTitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ShimmerTitle.id)

    }
}

//MARK: - Collection data source methods
extension BaseArticlesViewController {
    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataObject?.numberOfCategories ?? 0
    }

    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataObject?.categories[section].articles.count ?? 0
    }

    //MARK: - cell for row 
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch state {
        case .Loading:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShimmerCell.reuseID, for: indexPath) as! ShimmerCell
            return cell
        case .Showing:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as! NewsCell
            let cellData = dataObject?.categories[indexPath.section].articles[indexPath.row]
            cell.textLabel.text = cellData!.title
            
            return cell
        }
    }
    
    //MARK: - supplementary elemnt
    open override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch state {
            case .Loading:
                let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ShimmerTitle.id, for: indexPath) as! ShimmerTitle
                return sectionTitle
                
            case .Showing:
                let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitle.id, for: indexPath) as! SectionTitle
                sectionTitle.title = dataObject?.categories[indexPath.section].name ?? ""
                return sectionTitle
            }

        default:
            return UICollectionReusableView()
        }
    }
}
