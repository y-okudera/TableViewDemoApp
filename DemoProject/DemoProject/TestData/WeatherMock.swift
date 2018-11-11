//
//  WeatherMock.swift
//  DemoProject
//
//  Created by Yuki Okudera on 2018/11/12.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import Foundation

struct WeatherMock {
    
    static func fetch() -> [Weather] {
        do {
            guard let jsonData = try JSONFileReader.read(fileName: "weather.json") else {
                return []
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let decoder: JSONDecoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let weather = try decoder.decode([Weather].self, from: jsonData)
            return weather
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
