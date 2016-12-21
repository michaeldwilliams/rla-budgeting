//
//  VariableExpensesTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/25/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class VariableExpensesTableViewController: UITableViewController, UITextFieldDelegate {

    var expenses:[String:[[String:Double]]] = ["":[["Gasoline":0.00],["Food and Beverage":0.00],["Starbucks (Coffee/Tea)":0.00], ["Clothing":0.00],["Home Furnishings":0.00],["Personal Care /Cash":0.00],["Medical / Dental / Rx":0.00], ["Education / Self Improvement":0.00], ["Debt /Installment Payments":0.00], ["Entertainment":0.00],["Vacations / Holidays":0.00], ["Charitable Contributions":0.00], ["Savings":0.00],["Other":0.00]]]
    var sections = [String]()
    let expenseCell = "Expense Cell"
    let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
    let bottomNavigationView = BottomNavigationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.titleLabel.text = "Variable Expenses"
        titleView.subtitleLabel.text = "Your variable expenses go here..."
        bottomNavigationView.backNavigationTextLabel.text = "Income"
        bottomNavigationView.forwardNavigationTextLabel.text = "Variable Expenses"
        
        tableView.register(LineItemTableViewCell.self, forCellReuseIdentifier: expenseCell)
        
        for section in expenses.keys {
            self.sections.append(section)
        }
        
        
        self.tableView.tableHeaderView = titleView
        self.tableView.tableFooterView = bottomNavigationView
        self.tableView.rowHeight = 50
        tableView.reloadData()
        
        insetTableViewAndScrollIndicator(tableView: self.tableView, top: 100, left: 0, bottom: 0, right: 0)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    
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
