//
//  StatementLineItemTableViewCell.swift
//  budgeting
//
//  Created by Michael Williams on 11/27/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class StatementLineItemTableViewCell: UITableViewCell {

    var lineItemTitleLabel = UILabel()
    var lineItemDollarLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lineItemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lineItemDollarLabel.translatesAutoresizingMaskIntoConstraints = false
        lineItemTitleLabel.sizeToFit()
        lineItemTitleLabel.adjustsFontSizeToFitWidth = true
        addSubview(lineItemTitleLabel)
        addSubview(lineItemDollarLabel)
        
        let margins = layoutMarginsGuide
        lineItemTitleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineItemTitleLabel.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        lineItemTitleLabel.trailingAnchor.constraint(equalTo: lineItemDollarLabel.leadingAnchor, constant: -10).isActive = true
        lineItemDollarLabel.leadingAnchor.constraint(equalTo: lineItemTitleLabel.trailingAnchor).isActive = true
        lineItemDollarLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        lineItemDollarLabel.centerYAnchor.constraint(equalTo: lineItemTitleLabel.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
