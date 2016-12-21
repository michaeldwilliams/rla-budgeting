//
//  IncomeTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 12/15/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class IncomeTableViewController: UITableViewController, UITextFieldDelegate {

    var categories = [["Wages/Salaries":0.00],["Freelance/1099":0.00],["Other Income":0.00]]
    var incomeCell = "Income Cell"
    let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(LineItemTableViewCell.self, forCellReuseIdentifier: incomeCell)
        self.tableView.tableHeaderView = titleView
        self.tableView.rowHeight = 50
        self.tableView.isScrollEnabled = false
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: incomeCell, for: indexPath) as! LineItemTableViewCell
        let itemArray = categories[indexPath.row]
        var incomeItem = String()
        for key in itemArray.keys {
            incomeItem = key
        }
        var incomeValue = Double()
        for value in itemArray.values {
            incomeValue = value
        }
        cell.budgetLineItemView.label.text = incomeItem
        
        if incomeValue == 0.00 {
            cell.budgetLineItemView.lineItemTextField.text = ""
        } else {
            cell.budgetLineItemView.lineItemTextField.text = String(format: "%.2f", incomeValue)
        }
        
        cell.budgetLineItemView.lineItemTextField.delegate = self
        

        return cell
    }
    
    func updateDictionaryValue(atIndexPath indexPath:IndexPath) {
        let visibleCells = tableView.visibleCells as! [LineItemTableViewCell]
        var incomeItem = String()
        var incomeDictionary = [String:Double]()
        var label = String()
        var amount : String?
        
        incomeDictionary = categories[indexPath.row]
        
        for key in incomeDictionary.keys {
            for cell in visibleCells {
                label = cell.budgetLineItemView.label.text!
                amount = cell.budgetLineItemView.lineItemTextField.text
                if label == key {
                    incomeItem = key
                    break
                } else {
                    continue
                }
            }
        }
        
        if (amount?.isEmpty)! {
            return
        } else {
            if incomeItem == label {
                incomeDictionary.updateValue(Double(amount!)!, forKey: label)
                categories[indexPath.row] = incomeDictionary
                for (key, value) in incomeDictionary {
                    print("\(key)"+":"+"\(value)")
                }
                return
            } else {
                return
            }
        }
    }

    
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
