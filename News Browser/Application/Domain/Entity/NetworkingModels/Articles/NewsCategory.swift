//
//  ParsedData.swift
//  GORA News
//
//  Created by Николай Циминтия on 21.07.2023.
//

import Foundation

struct NewsCategory: Codable {
    var categoryName: String?
    var status: String
    var articles: [News]
}


