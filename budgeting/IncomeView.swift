//
//  IncomeView.swift
//  budgeting
//
//  Created by Michael Williams on 12/11/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class IncomeView: UIView {

    let incomeTitleView = TitleView()
    let wagesLineItemView = BudgetLineItemView()
    let freelanceLineItemView = BudgetLineItemView()
    let otherIncomeLineItemView = BudgetLineItemView()
    let bottomNavigationView = BottomNavigationView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        backgroundColor = .white
        
        incomeTitleView.title = "Income"
        incomeTitleView.subtitle = "The money you make goes here"
        incomeTitleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(incomeTitleView)
        
        let lightGray:UIColor = UIColor(white: 0.9, alpha: 1)
        
        let lineSeperatorTop = makeLineSeperator(ofColor: lightGray)
        addSubview(lineSeperatorTop)
        
        wagesLineItemView.translatesAutoresizingMaskIntoConstraints = false
        wagesLineItemView.label.text = "Wages/Salaries"
        addSubview(wagesLineItemView)
        
        let lineSeperatorMiddle = makeLineSeperator(ofColor: lightGray)
        addSubview(lineSeperatorMiddle)
        
        freelanceLineItemView.translatesAutoresizingMaskIntoConstraints = false
        freelanceLineItemView.label.text = "Freelance/1099"
        addSubview(freelanceLineItemView)
        
        let lineSeperatorBottom = makeLineSeperator(ofColor: lightGray)
        addSubview(lineSeperatorBottom)
        
        otherIncomeLineItemView.translatesAutoresizingMaskIntoConstraints = false
        otherIncomeLineItemView.label.text = "Other Income"
        addSubview(otherIncomeLineItemView)
        
        
//        bottomNavigationView.backNavigationTextLabel.text = "Get Started"
//        bottomNavigationView.forwardNavigationTextLabel.text = "Fixed Expenses"
//        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(bottomNavigationView)
//        
        
        
        // MARK: - AutoLayout
        let margins = layoutMarginsGuide
        let distanceBetweenLineItems:CGFloat = 30
        incomeTitleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        incomeTitleView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        incomeTitleView.topAnchor.constraint(equalTo: margins.topAnchor, constant: distanceBetweenLineItems).isActive = true
        lineSeperatorTop.topAnchor.constraint(equalTo: incomeTitleView.bottomAnchor, constant: 15).isActive = true
        lineSeperatorTop.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorTop.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        wagesLineItemView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        wagesLineItemView.topAnchor.constraint(equalTo: lineSeperatorTop.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
        wagesLineItemView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorMiddle.topAnchor.constraint(equalTo: wagesLineItemView.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
        lineSeperatorMiddle.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorMiddle.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        freelanceLineItemView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        freelanceLineItemView.topAnchor.constraint(equalTo: lineSeperatorMiddle.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
        freelanceLineItemView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorBottom.topAnchor.constraint(equalTo: freelanceLineItemView.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
        lineSeperatorBottom.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorBottom.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        otherIncomeLineItemView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        otherIncomeLineItemView.topAnchor.constraint(equalTo: lineSeperatorBottom.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
        otherIncomeLineItemView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        bottomNavigationView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        bottomNavigationView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
//        bottomNavigationView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true
//        bottomNavigationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
