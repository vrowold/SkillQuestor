//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class ResourceController: UITableViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if self.revealViewController() != nil {
           
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = 230
            
        }
        
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
        return 9
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as NewsTableViewCell
        
        // Configure the cell...
        if indexPath.row == 0 {
            cell.authorLabel.text = "Basketball"
            cell.authorImageView.image = UIImage(named: "basketball_icon")
        } else if indexPath.row == 1 {
            cell.authorLabel.text = "Chess"
            cell.authorImageView.image = UIImage(named: "chess_icon")
            
        } else if indexPath.row == 2 {
            cell.authorLabel.text = "Guitar"
            cell.authorImageView.image = UIImage(named: "guitar_icon")
            
        }else if indexPath.row == 3 {
            cell.authorLabel.text = "Painting"
            cell.authorImageView.image = UIImage(named: "painting_icon")
            
        }else if indexPath.row == 4 {
            cell.authorLabel.text = "Drawing"
            cell.authorImageView.image = UIImage(named: "drawing_icon")
            
        }else if indexPath.row == 5 {
            cell.authorLabel.text = "Tennis"
            cell.authorImageView.image = UIImage(named: "tennis_icon")
            
        }else if indexPath.row == 6 {
            cell.authorLabel.text = "Soccer"
            cell.authorImageView.image = UIImage(named: "soccer_icon")
            
        }else if indexPath.row == 7 {
            cell.authorLabel.text = "Bowling"
            cell.authorImageView.image = UIImage(named: "bowling_icon")
            
        }else {
            
            cell.authorLabel.text = "Billiards"
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
