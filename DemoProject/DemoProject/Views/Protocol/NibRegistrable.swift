//
//  NibRegistrable.swift
//  DemoProject
//
//  Created by STV_Okudera on 2018/11/13.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

protocol NibRegistrable {
    
    static var identifier: String { get }
    
    /// TableViewにNibを登録する
    ///
    /// - Parameter tableView: 登録先のTableView
    static func register(tableView: UITableView)
}

extension NibRegistrable where Self: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func register(tableView: UITableView) {
        tableView.register(
            UINib(nibName: identifier, bundle: Bundle(for: self)),
            forCellReuseIdentifier: identifier
        )
    }
}
