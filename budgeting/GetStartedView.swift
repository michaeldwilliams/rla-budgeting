//
//  GetStartedView.swift
//  budgeting
//
//  Created by Michael Williams on 12/12/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class GetStartedView: UIView {

    var getStartedButton:UIButton = {
        var getStartedButton = UIButton(type: UIButtonType.roundedRect)
        getStartedButton.setTitle("Get started", for: .normal)
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.backgroundColor = .blue
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.layer.cornerRadius = 10
        return getStartedButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {

        addSubview(getStartedButton)
        let headerText = makeHeader(withText: "Get Control.")
        addSubview(headerText)
        let subtitleText = makeSubtitle(withText: "A budget is the first step towards gaining control over your finances.")
        addSubview(subtitleText)
        
        let margins = layoutMarginsGuide
        headerText.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        headerText.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        headerText.topAnchor.constraint(equalTo: margins.topAnchor, constant: 200).isActive = true
        subtitleText.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        subtitleText.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        subtitleText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 25).isActive = true
        getStartedButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        getStartedButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        getStartedButton.topAnchor.constraint(equalTo: subtitleText.bottomAnchor, constant: 100).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
