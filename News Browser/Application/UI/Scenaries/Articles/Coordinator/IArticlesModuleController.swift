//
//  IArticlesModuleController.swift
//  News Browser
//
//  Created by Николай Циминтия on 05.08.2023.
//

import UIKit

protocol IArticlesModuleController {
    associatedtype T
    var completion: ((T) -> ())? {get set}
}
