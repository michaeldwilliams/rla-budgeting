//
//  IncomeViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/1/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

let nextButtonPressedNotificationKey = "Next Button Pressed"
let backButtonPressedNotificationKey = "Back Button Pressed"

class IncomeViewController: UIViewController, UITextFieldDelegate {
    
    let topNavigationBreadcrumbView = TopNavigationBreadcrumbView()
    let incomeTitleView = TitleView()
    let wagesLineItemView = BudgetLineItemView()
    let freelanceLineItemView = BudgetLineItemView()
    let otherIncomeLineItemView = BudgetLineItemView()
    let bottomNavigationView = BottomNavigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }


    
    func setupView() {
        view.backgroundColor = .white
        
        topNavigationBreadcrumbView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topNavigationBreadcrumbView)
        incomeTitleView.title = "Income"
        incomeTitleView.subtitle = "The money you make goes here"
        incomeTitleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(incomeTitleView)
        
        let lightGray:UIColor = UIColor(white: 0.9, alpha: 1)
        
        let lineSeperatorTop = makeLineSeperator(ofColor: lightGray)
        view.addSubview(lineSeperatorTop)
        
        wagesLineItemView.translatesAutoresizingMaskIntoConstraints = false
        wagesLineItemView.label.text = "Wages/Salaries"
        view.addSubview(wagesLineItemView)
        
        let lineSeperatorMiddle = makeLineSeperator(ofColor: lightGray)
        view.addSubview(lineSeperatorMiddle)
        
        freelanceLineItemView.translatesAutoresizingMaskIntoConstraints = false
        freelanceLineItemView.label.text = "Freelance/1099"
        view.addSubview(freelanceLineItemView)
        
        let lineSeperatorBottom = makeLineSeperator(ofColor: lightGray)
        view.addSubview(lineSeperatorBottom)
        
        otherIncomeLineItemView.translatesAutoresizingMaskIntoConstraints = false
        otherIncomeLineItemView.label.text = "Other Income"
        view.addSubview(otherIncomeLineItemView)
        
        
        bottomNavigationView.backNavigationText = "Get Started"
        bottomNavigationView.forwardNavigationText = "Fixed Expenses"
        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomNavigationView)
        
        
        
        // MARK: - AutoLayout
        let margins = view.layoutMarginsGuide
        let distanceBetweenLineItems:CGFloat = 30
        topNavigationBreadcrumbView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        topNavigationBreadcrumbView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        topNavigationBreadcrumbView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        topNavigationBreadcrumbView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        incomeTitleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        incomeTitleView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        incomeTitleView.topAnchor.constraint(equalTo: topNavigationBreadcrumbView.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
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
        bottomNavigationView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        bottomNavigationView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        bottomNavigationView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true
        bottomNavigationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}


