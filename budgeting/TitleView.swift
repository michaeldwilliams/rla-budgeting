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
        
        titleLabel = makeHeader(withText: title)
        self.addSubview(titleLabel)
        subtitleLabel = makeSubtitle(withText: subtitle)
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
    
    
    func makeHeader(withText text: String) -> UILabel {
        let headerText = UILabel()
        headerText.text = text
        headerText.textColor = .black
        headerText.font = .boldSystemFont(ofSize: 32)
        headerText.textAlignment = .center
        headerText.translatesAutoresizingMaskIntoConstraints = false
        return headerText
    }
    
    func makeSubtitle(withText text:String) -> UILabel {
        let subtitleText = UILabel()
        subtitleText.text = text
        subtitleText.textAlignment = .center
        subtitleText.textColor = .darkGray
        subtitleText.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleText.font = UIFont.systemFont(ofSize: 16)
        subtitleText.numberOfLines = 2
        subtitleText.translatesAutoresizingMaskIntoConstraints = false
        return subtitleText
    }

    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
