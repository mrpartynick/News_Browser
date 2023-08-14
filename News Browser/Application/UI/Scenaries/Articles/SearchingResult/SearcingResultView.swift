//
//  SearcingResultView.swift
//  News Browser
//
//  Created by Николай Циминтия on 13.08.2023.
//

import UIKit

class SearcingResultView: UITableViewController {
    
    private let dataObject: IArticlesDataObject = ArticlesDataObject()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
