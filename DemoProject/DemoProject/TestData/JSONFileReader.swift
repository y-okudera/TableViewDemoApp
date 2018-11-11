//
//  JSONFileReader.swift
//  DemoProject
//
//  Created by Yuki Okudera on 2018/11/12.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import Foundation

final class JSONFileReader: NSObject {
    
    /// Read data from the JSON file.
    ///
    /// - Parameter fileName: e.g. "area.json"
    /// - Returns: Returns nil if the target file does not exist in the bundle, and returns a data object if it exists.
    /// - Throws: Error when url can not be read.
    static func read(fileName: String) throws -> Data? {
        
        let name = fileName.deletingPathExtension
        let type = fileName.pathExtension
        guard let jsonFilePath = Bundle(for: self).path(forResource: name, ofType: type) else {
            return nil
        }
        let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
        return try Data(contentsOf: jsonFileURL)
    }
}
