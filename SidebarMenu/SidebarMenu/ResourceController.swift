//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class ResourceController: UITableViewController {
   
    var selectedSkill: skill = skill()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My " + selectedSkill.name.capitalizedString
        
      
        
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 5
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ResourceViewCell
        
        // Configure the cell...
        if indexPath.row == 0 {
            cell.authorLabel.text = "Resources"
            cell.authorImageView.image = UIImage(named: "skill_books")
        } else if indexPath.row == 1 {
            cell.authorLabel.text = "Practice History"
            cell.authorImageView.image = UIImage(named: "skill_calendar")
            
        } else if indexPath.row == 2 {
            cell.authorLabel.text = "Goals"
            cell.authorImageView.image = UIImage(named: "skill_goals")
            
        }else if indexPath.row == 3 {
            cell.authorLabel.text = "Journal"
            cell.authorImageView.image = UIImage(named: "skill_journal")
            
        }else{
            
            cell.authorLabel.text = "Practice now"
            cell.authorImageView.image = UIImage(named: "pool_icon")
            
        }
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "Goals") {
            let navVC = segue.destinationViewController as UINavigationController
            let destinationVC = navVC.topViewController as GoalsViewController
            
            let goalArray = ModelManager.instance.getGoals(selectedSkill)
            
          
            destinationVC.goalTextArray = goalArray
            
            
        }
    }
*/

    
}
