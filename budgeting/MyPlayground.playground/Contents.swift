//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
containerView.backgroundColor = .white
XCPShowView(identifier: "Container View", view: containerView)
XCPlaygroundPage.currentPage.liveView

func makeBottomNavigationView(withBackNavigationText backNavigationText:String, forwardNavigationText:String) -> UIView {
    let bottomNavigation = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    let line = UIView()
    line.backgroundColor = .darkGray
    line.translatesAutoresizingMaskIntoConstraints = false
    line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    bottomNavigation.addSubview(line)
    let backArrow = UIButton(type: .system)
    backArrow.setTitle("Back", for: .normal)
    backArrow.translatesAutoresizingMaskIntoConstraints = false
    bottomNavigation.addSubview(backArrow)
    let nextArrow = UIButton(type: .system)
    nextArrow.setTitle("Next", for: .normal)
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

let bottomNav = makeBottomNavigationView(withBackNavigationText: "Test", forwardNavigationText: "Test")
containerView.addSubview(bottomNav)


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

makeNumberInputTextField()
