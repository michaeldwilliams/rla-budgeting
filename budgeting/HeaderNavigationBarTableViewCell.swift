//
//  HeaderNavigationBarTableViewCell.swift
//  budgeting
//
//  Created by Michael Williams on 11/16/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class HeaderNavigationBarTableViewCell: UITableViewCell {
    
    func makeNumberLabel() -> UILabel {
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        numberLabel.backgroundColor = .blue
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        numberLabel.font = .systemFont(ofSize: 20)
        numberLabel.layer.cornerRadius = numberLabel.frame.width/2
        numberLabel.clipsToBounds = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return numberLabel
    }
    
    func makeNumberSubtitleLabel(withText text:String) -> UILabel {
        let subtitle = UILabel()
        subtitle.text = text
        subtitle.textColor = .black
        subtitle.textAlignment = .center
        subtitle.font = UIFont.preferredFont(forTextStyle: .caption1)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.numberOfLines = 0
        return subtitle
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let numberOneLabel = makeNumberLabel()
        numberOneLabel.text = "1"
        contentView.addSubview(numberOneLabel)
        let numberTwoLabel = makeNumberLabel()
        numberTwoLabel.text = "2"
        contentView.addSubview(numberTwoLabel)
        let numberThreeLabel = makeNumberLabel()
        numberThreeLabel.text = "3"
        contentView.addSubview(numberThreeLabel)
        
        let incomeLabel = makeNumberSubtitleLabel(withText: "INCOME")
        contentView.addSubview(incomeLabel)
        let fixedExpensesLabel = makeNumberSubtitleLabel(withText: "FIXED \nEXPENSES")
        contentView.addSubview(fixedExpensesLabel)
        let variableExpensesLabel = makeNumberSubtitleLabel(withText: "VARIABLE \nEXPENSES")
        contentView.addSubview(variableExpensesLabel)

        let margins = contentView.layoutMarginsGuide
        numberTwoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
