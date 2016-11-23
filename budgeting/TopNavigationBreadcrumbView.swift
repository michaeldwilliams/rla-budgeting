//
//  TopNavigationBreadcrumbView.swift
//  budgeting
//
//  Created by Michael Williams on 11/22/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class TopNavigationBreadcrumbView: UIView {
    
    var numberOneLabel = UILabel()
    var numberTwoLabel = UILabel()
    var numberThreeLabel = UILabel()
    var incomeLabel = UILabel()
    var fixedExpensesLabel = UILabel()
    var variableExpensesLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        numberOneLabel = makeNumberLabel(withText: "1", backgroundColor: .blue)
        self.addSubview(numberOneLabel)
        numberTwoLabel = makeNumberLabel(withText: "2", backgroundColor: .blue)
        self.addSubview(numberTwoLabel)
        numberThreeLabel = makeNumberLabel(withText: "3", backgroundColor: .blue)
        self.addSubview(numberThreeLabel)
        
        incomeLabel = makeNumberSubtitleLabel(withText: "INCOME")
        self.addSubview(incomeLabel)
        fixedExpensesLabel = makeNumberSubtitleLabel(withText: "FIXED \nEXPENSES")
        self.addSubview(fixedExpensesLabel)
        variableExpensesLabel = makeNumberSubtitleLabel(withText: "VARIABLE \nEXPENSES")
        self.addSubview(variableExpensesLabel)
        
        let margins = self.layoutMarginsGuide
        numberTwoLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        numberTwoLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
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
    
    func makeNumberLabel(withText text:String, backgroundColor:UIColor) -> UILabel {
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        numberLabel.text = text
        numberLabel.backgroundColor = backgroundColor
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
    
    
    

   
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
