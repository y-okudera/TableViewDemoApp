//
//  UserInfoCell.swift
//  DemoProject
//
//  Created by STV_Okudera on 2018/11/13.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

final class UserInfoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.addDoneToolbar()
        }
    }
}

extension UserInfoCell: NibRegistrable {}
