//
//  FileCahceService.swift
//  News Browser
//
//  Created by Николай Циминтия on 10.08.2023.
//

import Foundation

//MARK: - protocol
protocol IFileCahceService {
    
}

//MARK: - realization
class FileCahceService {
    private let fileManager = FileManager.default
    private let cacheFileName = "nskldnglsnglkgn"
    
    //MARK: - save
    public func saveData(data: [Data]) throws {
        guard let directoryURL = obtainDirectoryURL() else {throw CahceErrors.ObtainDirectoryError}
        let cacheFileURL = directoryURL.appendingPathComponent(cacheFileName)
        
        guard let codedData = try? PropertyListEncoder().encode(data) else {throw CahceErrors.DataEncodingError}
        try codedData.write(to: cacheFileURL)
//        guard let _ = try? codedData.write(to: cacheFileURL) else {throw CahceErrors.WritingError}
    }
    
    //MARK: - load 
    public func loadData() throws -> [Data] {
        guard let directoryURL = obtainDirectoryURL() else {throw CahceErrors.ObtainDirectoryError}
        let cacheFileURL = directoryURL.appendingPathComponent(cacheFileName)
        
        guard let data = try? Data(contentsOf: cacheFileURL) else {throw CahceErrors.DataEncodingError}
        guard let encodedData = try? PropertyListDecoder().decode([Data].self, from: data) else {throw CahceErrors.DataEncodingError}

        return encodedData
    }
    
    //MARK: - obtain directory
    private func obtainDirectoryURL() -> URL? {
        let directoryURL = try? fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return directoryURL
    }
    
}
