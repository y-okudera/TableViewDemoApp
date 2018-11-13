//
//  UserInfoViewController.swift
//  DemoProject
//
//  Created by STV_Okudera on 2018/11/13.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

final class UserInfoViewController: UIViewController {
    
    private var userInfoItems = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    /// 初期処理
    private func setup() {
        
        UserInfoCell.register(tableView: tableView)
        
        userInfoItems = [
            UserInfoItem.name,
            UserInfoItem.phonetic,
            UserInfoItem.mailAddress,
            UserInfoItem.password,
            UserInfoItem.tel,
            UserInfoItem.fax,
            UserInfoItem.address,
            UserInfoItem.birthday,
            UserInfoItem.office
        ]
        
        NotificationCenter.default.addObserver(
            self,
            selector: .keyboardWillShow,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: .keyboardWillHide,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

extension UserInfoViewController {
    
    @objc fileprivate func keyboardWillShow(_ notification: Notification) {
        
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
                return
        }
        
        let keyboardSize = keyboardInfo.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        UIView.animate(withDuration: duration, animations: {
            self.tableView.contentInset = contentInsets
            self.tableView.scrollIndicatorInsets = contentInsets
            self.view.layoutIfNeeded()
        })
    }
    
    @objc fileprivate func keyboardWillHide(_ notification: Notification) {
        tableView.contentInset = .zero
        tableView.scrollIndicatorInsets = .zero
    }
}

// MARK: - UITableViewDataSource
extension UserInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoCell.identifier,
                                                 for: indexPath) as! UserInfoCell
        cell.titleLabel.text = userInfoItems[indexPath.row]
        return cell
    }
}

// MARK: - Selectors
private extension Selector {
    static let keyboardWillShow = #selector(UserInfoViewController.keyboardWillShow(_:))
    static let keyboardWillHide = #selector(UserInfoViewController.keyboardWillHide(_:))
}
