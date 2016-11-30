//
//  LineItemTableViewCell.swift
//  budgeting
//
//  Created by Michael Williams on 11/24/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class LineItemTableViewCell: UITableViewCell {
    
    var budgetLineItemView = BudgetLineItemView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
    var expenseLabel = String()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        budgetLineItemView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(budgetLineItemView)
        selectionStyle = .none
        
        let margins = contentView.layoutMarginsGuide
        budgetLineItemView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        budgetLineItemView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        budgetLineItemView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    

    
}
