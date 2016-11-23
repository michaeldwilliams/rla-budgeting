//
//  FixedExpensesTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/16/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class FixedExpensesTableViewController: UITableViewController {

    let expenses:[String:[String]] = ["Housing":["Rent/Mortgage","Gas","Water/Power","Cable/Internet","Garbage","Property Tax","Homeowners/Renters Insurance"],"Transportation":["Car Payment","Car Insurance","Roadside Insurance"],"Other Expenses":["Health Insurance","Life Insurance","Disability Insurance","Student Loans","Cell Phone","Other"]]
    var sections = [String]()
    let expenseCell = "Expense Cell"
    var topNavigationBreadcrumbView = TopNavigationBreadcrumbView()
    var fixedExpensesTitleView = TitleView()
    var bottomNavigationView = BottomNavigationView()
    var budgetLineItemView = BudgetLineItemView()
    var headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    var footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    var tableViewRow = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: expenseCell)
        
        for section in expenses.keys {
            self.sections.append(section)
        }
        
        headerView.addSubview(makeTableViewHeaderView())
        footerView.addSubview(makeTableViewFooterView())
        self.tableView.tableHeaderView = headerView
        self.tableView.tableFooterView = footerView
        self.tableView.rowHeight = 50
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
    
    func makeTableViewRowView(indexPath:IndexPath) -> UIView {
        let rowView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        budgetLineItemView.translatesAutoresizingMaskIntoConstraints = false
        let sectionsArray = expenses[sections[indexPath.section]]
        let expenseItem = sectionsArray?[indexPath.row]
        budgetLineItemView.label.text = expenseItem
        rowView.addSubview(budgetLineItemView)
        
        let margins = rowView.layoutMarginsGuide
        budgetLineItemView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        budgetLineItemView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        budgetLineItemView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        return rowView
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
        let cell = tableView.dequeueReusableCell(withIdentifier: expenseCell, for: indexPath)
        tableViewRow = makeTableViewRowView(indexPath: indexPath)
        tableViewRow.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(tableViewRow)
        cell.selectionStyle = .none
        
        let margins = cell.contentView.layoutMarginsGuide
        tableViewRow.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        tableViewRow.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        tableViewRow.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        tableViewRow.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
