//
//  GetStartedViewController.swift
//  budgeting
//
//  Created by Michael Williams on 10/31/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    let getStartedView = GetStartedView(frame: UIScreen.main.bounds)
    
    func presentIncomeView() {
        let getStartedPageViewController = GetStartedPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        present(getStartedPageViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(getStartedView)
        getStartedView.getStartedButton.addTarget(self, action: #selector(self.presentIncomeView), for: .touchUpInside)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

