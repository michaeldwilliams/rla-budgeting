//
//  TitleView.swift
//  budgeting
//
//  Created by Michael Williams on 11/22/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class TitleView: UIView {
    
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var title = "Title"
    var subtitle = "Subtitle"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = makeHeader(withText: self.title)
        self.addSubview(titleLabel)
        subtitleLabel = makeSubtitle(withText: self.subtitle)
        self.addSubview(subtitleLabel)
        
        let margins = self.layoutMarginsGuide
        titleLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
