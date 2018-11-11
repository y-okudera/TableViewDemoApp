//
//  String+Path.swift
//  DemoProject
//
//  Created by Yuki Okudera on 2018/11/12.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import Foundation

extension String {
    
    private var ns: NSString {
        return (self as NSString)
    }
    
    var pathExtension: String {
        return ns.pathExtension
    }
    
    var deletingPathExtension: String {
        return ns.deletingPathExtension
    }
}
