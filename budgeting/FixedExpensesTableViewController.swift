//
//  FixedExpensesTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/16/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class FixedExpensesTableViewController: UITableViewController, UITextFieldDelegate {

    var expenses:[String:[[String:Double]]] = ["Housing":[["Rent/Mortgage":0.0],["Gas":0.0],["Water/Power":0.0],["Cable/Internet":0.0],["Garbage":0.0],["Property Tax":0.0],["Homeowners/Renters Insurance":0.0]],"Transportation":[["Car Payment":0.0],["Car Insurance":0.0],["Roadside Insurance":0.0]],"Other Expenses":[["Health Insurance":0.0],["Life Insurance":0.0],["Disability Insurance":0.0],["Student Loans":0.0],["Cell Phone":0.0],["Other":0.0]]]
    var fixedExpenseDollarAmounts = [String]()
    var sections = [String]()
    let expenseCell = "Expense Cell"
    let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
//    let bottomNavigationView = BottomNavigationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.titleLabel.text = "Fixed Expenses"
        titleView.subtitleLabel.text = "Your fixed expenses go here..."
//        bottomNavigationView.backNavigationTextLabel.text = "Income"
//        bottomNavigationView.forwardNavigationTextLabel.text = "Variable Expenses"
        
        tableView.register(LineItemTableViewCell.self, forCellReuseIdentifier: expenseCell)
        
        for section in expenses.keys {
            self.sections.append(section)
        }
        
        self.tableView.tableHeaderView = titleView
//        self.tableView.tableFooterView = bottomNavigationView
        self.tableView.rowHeight = 50
        
        insetTableViewAndScrollIndicator(tableView: self.tableView, top: 100, left: 0, bottom: 45, right: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dismissKeyboard), name: NSNotification.Name(rawValue: dismissKeyboardKey), object: nil)
    }

        
    func dismissKeyboard() {
        view.endEditing(true)
        
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
        let expenseDictionary = sectionsArray?[indexPath.row]
        var expenseItem = String()
        for key in (expenseDictionary?.keys)! {
            expenseItem = key
        }
        var expenseValue = Double()
        for value in (expenseDictionary?.values)! {
            expenseValue = value
        }
        cell.budgetLineItemView.label.text = expenseItem
        if expenseValue == 0.0 {
            cell.budgetLineItemView.lineItemTextField.text = ""
        } else {
            cell.budgetLineItemView.lineItemTextField.text = String(format: "%.2f", expenseValue)
        }
        cell.budgetLineItemView.lineItemTextField.delegate = self

        return cell
    }
    
    func updateDictionaryValue(atIndexPath indexPath:IndexPath) {
        let visibleCells = tableView.visibleCells as! [LineItemTableViewCell]
        var expenseItem = String()
        var expenseDictionary = [String:Double]()
        var label = String()
        var amount : String?
        
        var sectionsArray = expenses[sections[indexPath.section]]
        expenseDictionary = (sectionsArray?[indexPath.row])!
        
        for key in expenseDictionary.keys {
            for cell in visibleCells {
                label = cell.budgetLineItemView.label.text!
                amount = cell.budgetLineItemView.lineItemTextField.text
                if label == key {
                    expenseItem = key
                    break
                } else {
                    continue
                }
            }
        }
        
        if (amount?.isEmpty)! {
            return
        } else {
            if expenseItem == label {
                expenseDictionary.updateValue(Double(amount!)!, forKey: label)
                sectionsArray?[indexPath.row] = expenseDictionary
                expenses.updateValue(sectionsArray!, forKey: sections[indexPath.section])
                for (key, value) in expenseDictionary {
                    print("\(key)"+":"+"\(value)")
                }
                return
            } else {
                return
            }
        }
    }
    
    
    //MARK: UITextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.keyboardType = .decimalPad
        textField.spellCheckingType = .no
        textField.becomeFirstResponder()
        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = KeyboardAccessoryView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let pointInTable = textField.convert(textField.bounds.origin, to: self.tableView)
        let textFieldIndexPath = self.tableView.indexPathForRow(at: pointInTable)
        updateDictionaryValue(atIndexPath: textFieldIndexPath!)
        self.tableView.reloadData()
    }

}
