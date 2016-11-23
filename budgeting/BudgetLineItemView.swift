//
//  BudgetLineItemView.swift
//  budgeting
//
//  Created by Michael Williams on 11/22/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class BudgetLineItemView: UIView {
    
    var label = UILabel()
    var lineItemTextField = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = makeBudgetLineLabel(withText: "Line Item")
        self.addSubview(label)
        lineItemTextField = makeNumberInputTextField()
        self.addSubview(lineItemTextField)

        
        let margins = layoutMarginsGuide
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        lineItemTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        lineItemTextField.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBudgetLineLabel(withText text:String) -> UILabel {
        let bodyText = UILabel()
        bodyText.text = text
        bodyText.textColor = .black
        bodyText.font = UIFont.preferredFont(forTextStyle: .body)
        bodyText.font = UIFont.systemFont(ofSize: 16)
        bodyText.numberOfLines = 1
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        return bodyText
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

    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
