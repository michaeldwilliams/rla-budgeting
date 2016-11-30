//
//  FixedExpensesTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/16/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class FixedExpensesTableViewController: UITableViewController, UITextFieldDelegate {

    let expenses:[String:[String]] = ["Housing":["Rent/Mortgage","Gas","Water/Power","Cable/Internet","Garbage","Property Tax","Homeowners/Renters Insurance"],"Transportation":["Car Payment","Car Insurance","Roadside Insurance"],"Other Expenses":["Health Insurance","Life Insurance","Disability Insurance","Student Loans","Cell Phone","Other"]]
    var fixedExpenseDollarAmounts = [String]()
    var sections = [String]()
    var fixedExpenseDictionary:[[String:Double]] = [[:]]
    let expenseCell = "Expense Cell"
    var topNavigationBreadcrumbView = TopNavigationBreadcrumbView()
    var fixedExpensesTitleView = TitleView()
    var bottomNavigationView = BottomNavigationView()
    var headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    var footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LineItemTableViewCell.self, forCellReuseIdentifier: expenseCell)
        
        for section in expenses.keys {
            self.sections.append(section)
        }
        
        headerView.addSubview(makeTableViewHeaderView())
        footerView.addSubview(makeTableViewFooterView())
        self.tableView.tableHeaderView = headerView
        self.tableView.tableFooterView = footerView
        self.tableView.rowHeight = 50
    }

    func makeTableViewHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220))
        topNavigationBreadcrumbView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(self.topNavigationBreadcrumbView)
        fixedExpensesTitleView.translatesAutoresizingMaskIntoConstraints = false
        self.fixedExpensesTitleView.title = "Fixed Expenses"
        self.fixedExpensesTitleView.subtitle = "Fixed Expenses go here..."
        headerView.addSubview(self.fixedExpensesTitleView)
        
        let margins = headerView.layoutMarginsGuide
        let distanceBetweenLineItems:CGFloat = 30
        topNavigationBreadcrumbView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        topNavigationBreadcrumbView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        topNavigationBreadcrumbView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        topNavigationBreadcrumbView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        fixedExpensesTitleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        fixedExpensesTitleView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        fixedExpensesTitleView.topAnchor.constraint(equalTo: topNavigationBreadcrumbView.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
        return headerView
    }
    
    func makeTableViewFooterView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationView.backNavigationText = "Income"
        bottomNavigationView.forwardNavigationText = "Variable Expenses"
        footerView.addSubview(self.bottomNavigationView)
        
        let margins = footerView.layoutMarginsGuide
        bottomNavigationView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        bottomNavigationView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        bottomNavigationView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        bottomNavigationView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 10).isActive = true
        return footerView
    }
    
    func appendValuesToArray(withLabel label:String, amount:Double) {
        fixedExpenseDictionary.append([label:amount])
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses[sections[section]]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: expenseCell, for: indexPath) as! LineItemTableViewCell
        let sectionsArray = expenses[sections[indexPath.section]]
        let expenseItem = sectionsArray?[indexPath.row]
        cell.budgetLineItemView.label.text = expenseItem!
        cell.budgetLineItemView.lineItemTextField.delegate = self
//        cell.budgetLineItemView.lineItemTextField.text = ""
//        if (cell.budgetLineItemView.lineItemTextField.text?.isEmpty)! {
//            fixedExpenseDollarAmounts.append("")
//        } else {
//            fixedExpenseDollarAmounts.append(cell.budgetLineItemView.lineItemTextField.text!)
//        }
//        for x in fixedExpenseDollarAmounts {
//            print(x)
//        }
        return cell
    }
    
    //MARK: UITextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.keyboardType = .decimalPad
        textField.spellCheckingType = .no
        textField.becomeFirstResponder()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let visibleCells = tableView.visibleCells as! [LineItemTableViewCell]
        guard let indexPathForVisibleRows = tableView.indexPathsForVisibleRows else {return}
        
        for index in 0..<visibleCells.count {
            let cell = visibleCells[index]
            let indexPath = indexPathForVisibleRows[index]
            let sectionsArray = expenses[sections[indexPath.section]]
            let expenseItem = sectionsArray?[indexPath.row]
            let label = cell.budgetLineItemView.label.text
            if label == expenseItem! {
                appendValuesToArray(withLabel: label!, amount: Double(textField.text!)!)
                print("\(label!)"+":"+"\(textField.text!)")
            }
        }
    }

}
