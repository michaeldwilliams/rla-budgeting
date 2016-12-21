//
//  PageViewToolBar.swift
//  budgeting
//
//  Created by Michael Williams on 12/20/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class PageViewToolBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupView() {
        let backButton:UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        let nextButton:UIBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: nil)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let toolBar:UIToolbar = {
           let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
//            toolBar.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0)
            toolBar.barTintColor = .white
            toolBar.items = [backButton,flexSpace,nextButton]
            toolBar.sizeToFit()
            return toolBar
        }()
        
        addSubview(toolBar)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
