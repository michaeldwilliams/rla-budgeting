//
//  Extensions.swift
//  budgeting
//
//  Created by Michael Williams on 11/2/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
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
    
    func makeBody(withText text:String) -> UILabel {
        let bodyText = UILabel()
        bodyText.text = text
        bodyText.textColor = .black
        bodyText.font = UIFont.preferredFont(forTextStyle: .body)
        bodyText.font = UIFont.systemFont(ofSize: 16)
        bodyText.numberOfLines = 1
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        return bodyText
    }
    
    func makeNumberLabel() -> UILabel {
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        numberLabel.backgroundColor = .blue
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        numberLabel.font = .systemFont(ofSize: 20)
        numberLabel.layer.cornerRadius = numberLabel.frame.width/2
        numberLabel.clipsToBounds = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return numberLabel
    }
    
    func makeNumberSubtitleLabel(withText text:String) -> UILabel {
        let subtitle = UILabel()
        subtitle.text = text
        subtitle.textColor = .black
        subtitle.textAlignment = .center
        subtitle.font = UIFont.preferredFont(forTextStyle: .caption1)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.numberOfLines = 0
        return subtitle
    }

    func makeLineSeperator(ofColor color:UIColor) -> UIView {
        let line = UIView()
        line.backgroundColor = color
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return line
    }
    
    func makeNumberInputTextField() -> UITextField {
        let textfield = UITextField()
        let dollarSignOverlay = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 15))
        dollarSignOverlay.text = "$"
        dollarSignOverlay.textColor = .lightGray
        textfield.placeholder = "0.00"
        textfield.borderStyle = UITextBorderStyle.roundedRect
        textfield.leftView = dollarSignOverlay
        textfield.leftViewMode = .always
        textfield.textAlignment = .right
        textfield.adjustsFontSizeToFitWidth = true
        textfield.widthAnchor.constraint(equalToConstant: 120).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textfield.keyboardType = .numberPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }

    func makeBottomNavigationView(withBackNavigationText backNavigationText:String, forwardNavigationText:String, backViewController:UIViewController, forwardViewController:UIViewController) -> UIView {
        let bottomNavigation = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        let line = UIView()
        line.backgroundColor = .darkGray
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomNavigation.addSubview(line)
        let backArrow = UIButton(type: .system)
        backArrow.setTitle("<", for: .normal)
        backArrow.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigation.addSubview(backArrow)
        let nextArrow = UIButton(type: .system)
        nextArrow.setTitle(">", for: .normal)
        nextArrow.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        nextArrow.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigation.addSubview(nextArrow)
        let nextNavigationAttributedText = NSMutableAttributedString(string: "NEXT", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold), NSForegroundColorAttributeName:UIColor.black])
        nextNavigationAttributedText.append(NSMutableAttributedString(string: "\n\(forwardNavigationText)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName:UIColor.black]))
        let nextNavigationLabel = UILabel()
        nextNavigationLabel.textAlignment = .right
        nextNavigationLabel.numberOfLines = 0
        nextNavigationLabel.attributedText = nextNavigationAttributedText
        nextNavigationLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigation.addSubview(nextNavigationLabel)
        let backNavigationAttributedText = NSMutableAttributedString(string: "BACK", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold), NSForegroundColorAttributeName:UIColor.black])
        backNavigationAttributedText.append(NSMutableAttributedString(string: "\n\(backNavigationText)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName:UIColor.black]))
        let backNavigationLabel = UILabel()
        backNavigationLabel.numberOfLines = 0
        backNavigationLabel.attributedText = backNavigationAttributedText
        backNavigationLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigation.addSubview(backNavigationLabel)
        let margins = bottomNavigation.layoutMarginsGuide
        backArrow.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        backArrow.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        backNavigationLabel.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 5).isActive = true
        backNavigationLabel.centerYAnchor.constraint(equalTo: backArrow.centerYAnchor).isActive = true
        nextArrow.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        nextArrow.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        nextNavigationLabel.trailingAnchor.constraint(equalTo: nextArrow.leadingAnchor, constant: -5).isActive = true
        nextNavigationLabel.centerYAnchor.constraint(equalTo: nextArrow.centerYAnchor).isActive = true
        line.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        line.bottomAnchor.constraint(equalTo: nextNavigationLabel.topAnchor, constant: -8).isActive = true
        return bottomNavigation
    }
    
    func presentViewController(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func nextButtonPressed() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: nextButtonPressedNotificationKey), object: self)
    }
    
    func backButtonPressed() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: backButtonPressedNotificationKey), object: self)
    }
    

}
