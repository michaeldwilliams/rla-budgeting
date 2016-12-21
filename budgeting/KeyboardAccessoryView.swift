//
//  KeyboardAccessoryView.swift
//  budgeting
//
//  Created by Michael Williams on 12/19/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class KeyboardAccessoryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        let doneButton:UIBarButtonItem = {
            let button = UIBarButtonItem(title: "Dismiss", style: UIBarButtonItemStyle.plain, target: self, action: #selector(notifyKeyboardDismissal))
            return button
        }()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.items = [doneButton,flexSpace]
        toolBar.sizeToFit()
        
        addSubview(toolBar)

    }
    
    func notifyKeyboardDismissal() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: dismissKeyboardKey), object: self)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
