//
//  BottomNavigationView.swift
//  budgeting
//
//  Created by Michael Williams on 11/22/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class BottomNavigationView: UIView {
    
    let line = UIView()
    let backArrow = UIButton(type: .system)
    let nextArrow = UIButton(type: .system)
    var nextNavigationAttributedText = NSMutableAttributedString(
        string: "NEXT",
        attributes: [
            NSFontAttributeName: UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold),
            NSForegroundColorAttributeName: UIColor.black
        ])
    var backNavigationAttributedText = NSMutableAttributedString(
        string: "BACK",
        attributes: [
            NSFontAttributeName: UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold),
            NSForegroundColorAttributeName:UIColor.black
        ])
    var forwardNavigationText = "Next View"
    var backNavigationText = "Previous View"
    let bottomNavigationFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        line.backgroundColor = .darkGray
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        addSubview(line)

        backArrow.setTitle("<", for: .normal)
        backArrow.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backArrow)
        
        nextArrow.setTitle(">", for: .normal)
        nextArrow.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        nextArrow.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nextArrow)
        
        nextNavigationAttributedText.append(NSMutableAttributedString(string: "\n\(forwardNavigationText)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName:UIColor.black]))
        let nextNavigationLabel = UILabel()
        nextNavigationLabel.textAlignment = .right
        nextNavigationLabel.numberOfLines = 0
        nextNavigationLabel.attributedText = nextNavigationAttributedText
        nextNavigationLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nextNavigationLabel)
        
        backNavigationAttributedText.append(NSMutableAttributedString(string: "\n\(backNavigationText)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName:UIColor.black]))
        let backNavigationLabel = UILabel()
        backNavigationLabel.numberOfLines = 0
        backNavigationLabel.attributedText = backNavigationAttributedText
        backNavigationLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backNavigationLabel)

        
        let margins = layoutMarginsGuide
        backArrow.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        backArrow.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        backNavigationLabel.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 5).isActive = true
        backNavigationLabel.centerYAnchor.constraint(equalTo: backArrow.centerYAnchor).isActive = true
        nextArrow.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        nextArrow.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        nextNavigationLabel.trailingAnchor.constraint(equalTo: nextArrow.leadingAnchor, constant: -5).isActive = true
        nextNavigationLabel.centerYAnchor.constraint(equalTo: nextArrow.centerYAnchor).isActive = true
        line.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        line.bottomAnchor.constraint(equalTo: nextNavigationLabel.topAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func nextButtonPressed() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: nextButtonPressedNotificationKey), object: self)
    }
    
    func backButtonPressed() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: backButtonPressedNotificationKey), object: self)
    }

    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
