//
//  DateUtil.swift
//  DemoProject
//
//  Created by Yuki Okudera on 2018/11/12.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import Foundation

private let defaultFormat = "MM/dd/yyyy HH:mm"
private let defaultLocale = Locale(identifier: "en_US_POSIX")

struct DateUtil {
    
    /// Convert date to string.
    static func dateToString(date: Date,
                             dateFormat: String = defaultFormat,
                             locale: Locale = defaultLocale) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: date)
    }
    
    /// Convert string to date.
    func stringtoDate(dateString: String,
                      dateFormat: String = defaultFormat,
                      locale: Locale = defaultLocale) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.date(from: dateString)
    }
}
