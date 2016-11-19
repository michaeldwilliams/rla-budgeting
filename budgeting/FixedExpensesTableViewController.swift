//
//  FixedExpensesTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/16/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class FixedExpensesTableViewController: UITableViewController {

    let sections = ["","Housing","Transportation","Other Expenses"]
    let expenses = [["",""],["Rent/Mortgage","Gas","Water/Power","Cable/Internet","Garbage","Property Tax","Homeowners/Renters Insurance"],["Car Payment","Car Insurance","Roadside Insurance"],["Health Insurance","Life Insurance","Disability Insurance","Student Loans","Cell Phone","Other"]]
    let headerCell = "Header Cell"
    let titleCell = "Title Cell"
    let expenseCell = "Expense Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
/*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: headerCell, for: indexPath) as! HeaderNavigationBarTableViewCell
                return cell
            }
        }
        else if indexPath.section == 0 {
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: titleCell, for: indexPath)
                cell.backgroundColor = .red
                return cell
            }
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: expenseCell, for: indexPath)
            cell.backgroundColor = .blue
            return cell
        }
        return cell

    }
 */

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
