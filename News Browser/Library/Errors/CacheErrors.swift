//
//  CacheErrors.swift
//  News Browser
//
//  Created by Николай Циминтия on 10.08.2023.
//

import Foundation

enum CahceErrors: String, Error {
    case ObtainDirectoryError = "Some bad with obtaining directory"
    case WritingError = "Some bad with writing files"
    case DataEncodingError = "Some bad with encoding data"
}
