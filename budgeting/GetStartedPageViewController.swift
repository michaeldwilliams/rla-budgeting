//
//  GetStartedPageViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/14/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class GetStartedPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let incomeTableViewController = IncomeTableViewController()
    let fixedExpensesTableViewController = FixedExpensesTableViewController()
    let variableExpensesTableViewController = VariableExpensesTableViewController()
    let statementTableViewController = StatementTableViewController()
    var pageViewControllersArray:[UIViewController] = []
    let breadcrumbViewNav = TopNavigationBreadcrumbView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 80))
    var currentIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(breadcrumbViewNav)
        self.pageViewControllersArray.append(incomeTableViewController)
        self.pageViewControllersArray.append(fixedExpensesTableViewController)
        self.pageViewControllersArray.append(variableExpensesTableViewController)
        self.pageViewControllersArray.append(statementTableViewController)
        self.setViewControllers([pageViewControllersArray[0]], direction: .forward, animated: false, completion: nil)
        dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(GetStartedPageViewController.navigateToNextViewController), name: NSNotification.Name(rawValue: nextButtonPressedNotificationKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(GetStartedPageViewController.navigateToPreviousViewController), name: NSNotification.Name(rawValue: backButtonPressedNotificationKey), object: nil)
    }


    func navigateToNextViewController() {
        if currentIndex < pageViewControllersArray.count - 1 {
            self.setViewControllers([self.pageViewControllersArray[currentIndex + 1]], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func navigateToPreviousViewController() {
        if currentIndex > 0 {
            self.setViewControllers([self.pageViewControllersArray[currentIndex - 1]], direction: .reverse, animated: true, completion: nil)
        }
        else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.pageViewControllersArray.index(of: viewController) {
            self.currentIndex = Int(index)
            if index > 0 {
                return pageViewControllersArray[index - 1]
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = self.pageViewControllersArray.index(of: viewController) {
            self.currentIndex = Int(index)
            if index < pageViewControllersArray.count - 1 {
                return pageViewControllersArray[index + 1]
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    


}
