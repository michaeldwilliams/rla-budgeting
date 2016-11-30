//
//  VariableExpensesTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/25/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class VariableExpensesTableViewController: UITableViewController {

    let expenses:[String:[String]] = ["":["Gasoline","Food and Beverage","Starbucks (Coffee/Tea)", "Clothing","Home Furnishings","Personal Care /Cash","Medical / Dental / Rx", "Education / Self Improvement", "Debt /Installment Payments", "Entertainment","Vacations / Holidays", "Charitable Contributions", "Savings","Other"]]
    var sections = [String]()
    let expenseCell = "Expense Cell"
    var topNavigationBreadcrumbView = TopNavigationBreadcrumbView()
    var variableExpensesTitleView = TitleView()
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
        tableView.reloadData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func makeTableViewHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220))
        topNavigationBreadcrumbView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(self.topNavigationBreadcrumbView)
        variableExpensesTitleView.translatesAutoresizingMaskIntoConstraints = false
        self.variableExpensesTitleView.title = "Fixed Expenses"
        self.variableExpensesTitleView.subtitle = "Fixed Expenses go here..."
        headerView.addSubview(self.variableExpensesTitleView)
        
        let margins = headerView.layoutMarginsGuide
        let distanceBetweenLineItems:CGFloat = 30
        topNavigationBreadcrumbView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        topNavigationBreadcrumbView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        topNavigationBreadcrumbView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        topNavigationBreadcrumbView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        variableExpensesTitleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        variableExpensesTitleView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        variableExpensesTitleView.topAnchor.constraint(equalTo: topNavigationBreadcrumbView.bottomAnchor, constant: distanceBetweenLineItems).isActive = true
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
        
        return cell
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

}
