//
//  ExpensesHeaderFooterView.swift
//  budgeting
//
//  Created by Michael Williams on 12/12/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class ExpensesHeaderFooterView: UIView {

    var headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
    var footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    var titleView = TitleView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
    var bottomNavigationView = BottomNavigationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.title = "Title"
        titleView.subtitle = "Subtitle"
        headerView.addSubview(titleView)
        
        let headerMargins = headerView.layoutMarginsGuide
        titleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleView.centerXAnchor.constraint(equalTo: headerMargins.centerXAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: headerMargins.topAnchor).isActive = true
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationView.backNavigationTextLabel.text = "Income"
        bottomNavigationView.forwardNavigationTextLabel.text = "Variable Expenses"
        footerView.addSubview(bottomNavigationView)
        
        let footerMargins = footerView.layoutMarginsGuide
        bottomNavigationView.leadingAnchor.constraint(equalTo: footerMargins.leadingAnchor).isActive = true
        bottomNavigationView.trailingAnchor.constraint(equalTo: footerMargins.trailingAnchor).isActive = true
        bottomNavigationView.topAnchor.constraint(equalTo: footerMargins.topAnchor, constant: 10).isActive = true
        bottomNavigationView.bottomAnchor.constraint(equalTo: footerMargins.bottomAnchor, constant: 10).isActive = true
        
        
        headerView.addSubview(titleView)
        footerView.addSubview(bottomNavigationView)
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
