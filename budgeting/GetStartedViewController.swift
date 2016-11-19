//
//  GetStartedViewController.swift
//  budgeting
//
//  Created by Michael Williams on 10/31/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    lazy var getStartedButton:UIButton = {
        var getStartedButton = UIButton(type: UIButtonType.roundedRect)
        getStartedButton.setTitle("Get started", for: .normal)
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.backgroundColor = .blue
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.addTarget(self, action: #selector(self.presentIncomeView), for: .touchUpInside)
        self.view.addSubview(getStartedButton)
        return getStartedButton
    }()
    
    func presentIncomeView() {
        let getStartedPageViewController = GetStartedPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        present(getStartedPageViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerText = makeHeader(withText: "Get Control.")
        view.addSubview(headerText)
        let subtitleText = makeSubtitle(withText: "A budget is the first step towards gaining control over your finances.")
        view.addSubview(subtitleText)
        
        let margins = view.layoutMarginsGuide
        headerText.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        headerText.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        headerText.topAnchor.constraint(equalTo: margins.topAnchor, constant: 200).isActive = true
        subtitleText.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        subtitleText.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        subtitleText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 25).isActive = true
        getStartedButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        getStartedButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        getStartedButton.topAnchor.constraint(equalTo: subtitleText.bottomAnchor, constant: 100).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

