//
//  ArticlesNavigationController.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import UIKit

final class ArticlesNavigationController: UINavigationController {
                
    //MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
