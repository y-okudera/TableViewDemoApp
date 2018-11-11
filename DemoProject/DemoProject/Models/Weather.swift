//
//  Weather.swift
//  DemoProject
//
//  Created by Yuki Okudera on 2018/11/12.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    let time: Date
    let location: String
    let timeEvents: [TimeEvents]
    
    func displayText(row: Int) -> String {
        let validTime = DateUtil.dateToString(date: timeEvents[row].validTime)
        let parameters = timeEvents[row].parameters.filter { $0.name == "temperature" }
        guard
            let value = parameters.first?.values.first,
            let unit = parameters.first?.unit else {
                return ""
        }
        let text = "\(validTime) : \(value)\(unit)"
        return text
    }
}

struct TimeEvents: Codable {
    let validTime: Date
    let parameters: [Parameters]
}

struct Parameters: Codable {
    let name: String
    let unit: String
    let values: [Double]
}
