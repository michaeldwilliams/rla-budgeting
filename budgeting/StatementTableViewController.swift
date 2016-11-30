//
//  StatementTableViewController.swift
//  budgeting
//
//  Created by Michael Williams on 11/27/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import UIKit

class StatementTableViewController: UITableViewController {
    
    var statementLineItems:[String:[String]] = ["Income":["Wages","1099/Freelance","Other Income"],"Donations and Savings":["Church","Charity","Personal Savings","Retirement"],"Living Expenses":["Fixed Expenses","Variable Expenses"]]
    var sections = [String]()
    let statementTitleView = TitleView()
    var headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    var footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
    let statementCell = "Statement Cell"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(StatementLineItemTableViewCell.self, forCellReuseIdentifier: statementCell)
        
        for section in statementLineItems.keys {
            self.sections.append(section)
        }
        
        headerView.addSubview(makeTableViewHeaderView())
        tableView.tableHeaderView = headerView
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func makeTableViewHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220))
        statementTitleView.translatesAutoresizingMaskIntoConstraints = false
        self.statementTitleView.title = "Your Statement"
        self.statementTitleView.subtitle = ""
        headerView.addSubview(self.statementTitleView)
        
        let margins = headerView.layoutMarginsGuide
        let distanceBetweenLineItems:CGFloat = 30
        statementTitleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        statementTitleView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        statementTitleView.topAnchor.constraint(equalTo: margins.topAnchor, constant: distanceBetweenLineItems).isActive = true
        return headerView
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementLineItems[sections[section]]!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: statementCell, for: indexPath) as! StatementLineItemTableViewCell
        let sectionsArray = statementLineItems[sections[indexPath.section]]
        let statementItem = sectionsArray?[indexPath.row]
        cell.lineItemTitleLabel.text = statementItem

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
