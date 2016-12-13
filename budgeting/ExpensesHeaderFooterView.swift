//
//  ExpensesHeaderFooterView.swift
//  budgeting
//
//  Created by Michael Williams on 12/12/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class ExpensesHeaderFooterView: UIView {

    var headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    var footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    var titleView = TitleView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        var bottomNavigationView = BottomNavigationView()
        
        func makeTableViewHeaderView() -> UIView {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220))
            titleView.translatesAutoresizingMaskIntoConstraints = false
            titleView.title = "Fixed Expenses"
            titleView.subtitle = "Fixed Expenses go here..."
            headerView.addSubview(titleView)
            
            let margins = headerView.layoutMarginsGuide
            titleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            titleView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
            titleView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100).isActive = true
            return headerView
        }
        
        func makeTableViewFooterView() -> UIView {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
            bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
            bottomNavigationView.backNavigationText = "Income"
            bottomNavigationView.forwardNavigationText = "Variable Expenses"
            footerView.addSubview(bottomNavigationView)
            
            let margins = footerView.layoutMarginsGuide
            bottomNavigationView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            bottomNavigationView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            bottomNavigationView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
            bottomNavigationView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 10).isActive = true
            return footerView
        }

        headerView.addSubview(makeTableViewHeaderView())
        footerView.addSubview(makeTableViewFooterView())

        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
