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
    let fixedExpenseView = ExpensesHeaderFooterView(frame: UIScreen.main.bounds)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LineItemTableViewCell.self, forCellReuseIdentifier: expenseCell)
        
        for section in expenses.keys {
            self.sections.append(section)
        }
        
        self.tableView.tableHeaderView = fixedExpenseView.headerView
        self.tableView.tableFooterView = fixedExpenseView.footerView
        self.tableView.rowHeight = 50
        let inset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        self.tableView.contentInset = inset
        self.tableView.scrollIndicatorInsets = inset
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
