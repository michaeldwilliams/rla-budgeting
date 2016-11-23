//
//  Extensions.swift
//  budgeting
//
//  Created by Michael Williams on 11/2/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func makeHeader(withText text: String) -> UILabel {
        let headerText = UILabel()
        headerText.text = text
        headerText.textColor = .black
        headerText.font = .boldSystemFont(ofSize: 32)
        headerText.textAlignment = .center
        headerText.translatesAutoresizingMaskIntoConstraints = false
        return headerText
    }
    
    func makeSubtitle(withText text:String) -> UILabel {
        let subtitleText = UILabel()
        subtitleText.text = text
        subtitleText.textAlignment = .center
        subtitleText.textColor = .darkGray
        subtitleText.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleText.font = UIFont.systemFont(ofSize: 16)
        subtitleText.numberOfLines = 2
        subtitleText.translatesAutoresizingMaskIntoConstraints = false
        return subtitleText
    }
    
    func makeLineSeperator(ofColor color:UIColor) -> UIView {
        let line = UIView()
        line.backgroundColor = color
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return line
    }
    
    

    

}
