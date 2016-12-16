//
//  IncomeTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 12/15/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class IncomeTableViewController: UITableViewController, UITextFieldDelegate {

    var categories = ["Wages/Salaries","Freelance/1099","Other Income"]
    var incomeCell = "Income Cell"
    let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
    let bottomNavigationView = BottomNavigationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(LineItemTableViewCell.self, forCellReuseIdentifier: incomeCell)
        self.tableView.tableHeaderView = titleView
        self.tableView.tableFooterView = bottomNavigationView
        self.tableView.rowHeight = 50
        self.tableView.isScrollEnabled = false
        view.addSubview(bottomNavigationView)
        insetTableViewAndScrollIndicator(tableView: self.tableView, top: 100, left: 0, bottom: 0, right: 0)
        
        let margins = view.layoutMarginsGuide
        bottomNavigationView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        cell.budgetLineItemView.label.text = categories[indexPath.row]
        cell.budgetLineItemView.lineItemTextField.delegate = self
        

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
