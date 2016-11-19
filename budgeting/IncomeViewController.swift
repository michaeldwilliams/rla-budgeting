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

class IncomeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    
    func setupView() {
        view.backgroundColor = .white
        
        let numberOneLabel = makeNumberLabel()
        numberOneLabel.text = "1"
        view.addSubview(numberOneLabel)
        let numberTwoLabel = makeNumberLabel()
        numberTwoLabel.text = "2"
        view.addSubview(numberTwoLabel)
        let numberThreeLabel = makeNumberLabel()
        numberThreeLabel.text = "3"
        view.addSubview(numberThreeLabel)
        
        let incomeLabel = makeNumberSubtitleLabel(withText: "INCOME")
        view.addSubview(incomeLabel)
        let fixedExpensesLabel = makeNumberSubtitleLabel(withText: "FIXED \nEXPENSES")
        view.addSubview(fixedExpensesLabel)
        let variableExpensesLabel = makeNumberSubtitleLabel(withText: "VARIABLE \nEXPENSES")
        view.addSubview(variableExpensesLabel)
        
        let incomeTitleLabel = makeHeader(withText: "Income")
        view.addSubview(incomeTitleLabel)
        let incomeSubtitleLabel = makeSubtitle(withText: "The money you make.")
        view.addSubview(incomeSubtitleLabel)
        
        let lightGray:UIColor = UIColor(white: 0.9, alpha: 1)
        
        let lineSeperatorTop = makeLineSeperator(ofColor: lightGray)
        view.addSubview(lineSeperatorTop)
        
        let wagesLabel = makeBody(withText: "Wages/Salaries")
        view.addSubview(wagesLabel)
        
        let lineSeperatorMiddle = makeLineSeperator(ofColor: lightGray)
        view.addSubview(lineSeperatorMiddle)
        
        let freelanceLabel = makeBody(withText: "1099/Freelance")
        view.addSubview(freelanceLabel)
        
        let lineSeperatorBottom = makeLineSeperator(ofColor: lightGray)
        view.addSubview(lineSeperatorBottom)
        
        let otherIncomeLabel = makeBody(withText: "Other Income")
        view.addSubview(otherIncomeLabel)
        
        let wagesTextField = makeNumberInputTextField()
        view.addSubview(wagesTextField)
        
        let freelanceTextField = makeNumberInputTextField()
        view.addSubview(freelanceTextField)
        
        let otherIncomeTextField = makeNumberInputTextField()
        view.addSubview(otherIncomeTextField)
        
        let getStartedViewController:UIViewController = GetStartedViewController()
        let fixedExpensesViewController:UIViewController = FixedExpensesTableViewController()
        
        let bottomNavigation = makeBottomNavigationView(withBackNavigationText: "Get Started", forwardNavigationText: "Fixed Expenses", backViewController: getStartedViewController, forwardViewController: fixedExpensesViewController)
        bottomNavigation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomNavigation)
        
        
        
        // MARK: - AutoLayout
        let margins = view.layoutMarginsGuide
        numberTwoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberTwoLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40).isActive = true
        numberOneLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        numberOneLabel.centerYAnchor.constraint(equalTo: numberTwoLabel.centerYAnchor).isActive = true
        numberThreeLabel.centerYAnchor.constraint(equalTo: numberTwoLabel.centerYAnchor).isActive = true
        numberThreeLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        incomeLabel.centerXAnchor.constraint(equalTo: numberOneLabel.centerXAnchor).isActive = true
        incomeLabel.topAnchor.constraint(equalTo: numberOneLabel.bottomAnchor, constant: 5).isActive = true
        fixedExpensesLabel.centerXAnchor.constraint(equalTo: numberTwoLabel.centerXAnchor).isActive = true
        fixedExpensesLabel.topAnchor.constraint(equalTo: numberTwoLabel.bottomAnchor, constant: 5).isActive = true
        variableExpensesLabel.centerXAnchor.constraint(equalTo: numberThreeLabel.centerXAnchor).isActive = true
        variableExpensesLabel.topAnchor.constraint(equalTo: numberThreeLabel.bottomAnchor, constant: 5).isActive = true
        incomeTitleLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        incomeTitleLabel.topAnchor.constraint(equalTo: fixedExpensesLabel.bottomAnchor, constant: 20).isActive = true
        incomeSubtitleLabel.centerXAnchor.constraint(equalTo: incomeTitleLabel.centerXAnchor).isActive = true
        incomeSubtitleLabel.topAnchor.constraint(equalTo: incomeTitleLabel.bottomAnchor, constant: 15).isActive = true
        lineSeperatorTop.topAnchor.constraint(equalTo: incomeSubtitleLabel.bottomAnchor, constant: 15).isActive = true
        lineSeperatorTop.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorTop.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        wagesTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        wagesTextField.topAnchor.constraint(equalTo: lineSeperatorTop.bottomAnchor, constant: 8).isActive = true
        wagesLabel.centerYAnchor.constraint(equalTo: wagesTextField.centerYAnchor).isActive = true
        wagesLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorMiddle.topAnchor.constraint(equalTo: wagesTextField.bottomAnchor, constant: 8).isActive = true
        lineSeperatorMiddle.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorMiddle.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        freelanceTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        freelanceTextField.topAnchor.constraint(equalTo: lineSeperatorMiddle.bottomAnchor, constant: 8).isActive = true
        freelanceLabel.centerYAnchor.constraint(equalTo: freelanceTextField.centerYAnchor).isActive = true
        freelanceLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorBottom.topAnchor.constraint(equalTo: freelanceTextField.bottomAnchor, constant: 8).isActive = true
        lineSeperatorBottom.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineSeperatorBottom.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        otherIncomeTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        otherIncomeTextField.topAnchor.constraint(equalTo: lineSeperatorBottom.bottomAnchor, constant: 8).isActive = true
        otherIncomeLabel.centerYAnchor.constraint(equalTo: otherIncomeTextField.centerYAnchor).isActive = true
        otherIncomeLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        bottomNavigation.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        bottomNavigation.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        bottomNavigation.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true
        bottomNavigation.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
}
