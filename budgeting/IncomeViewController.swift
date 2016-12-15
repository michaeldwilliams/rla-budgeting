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
    
    let incomeView = IncomeView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(incomeView)
        
    }


    
        
}


