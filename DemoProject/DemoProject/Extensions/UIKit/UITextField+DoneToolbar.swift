//
//  UITextField+DoneToolbar.swift
//  DemoProject
//
//  Created by STV_Okudera on 2018/11/13.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// Doneツールバーを追加する
    func addDoneToolbar(onDone: (target: Any, action: Selector)? = nil) {
        
        let onDone = onDone ?? (target: self, action: #selector(didTapDone))
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: onDone.target,
            action: onDone.action
        )
        
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            doneButton
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    @objc func didTapDone() {
        self.resignFirstResponder()
    }
}
