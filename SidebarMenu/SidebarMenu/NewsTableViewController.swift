//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!

    let skillArray = ModelManager.instance.getAllSkillNames()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
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
        return skillArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell

        var skill = skillArray[indexPath.row]
        
        cell.authorLabel.text = skill.name.capitalizedString
        cell.authorImageView.image = UIImage(named: (skill.name + "_icon"))
        cell.inButton.tag = indexPath.row
        //cell.inButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        println(cell.inButton.tag)
        
        
        
        
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

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "Resource") {
            let navVC = segue.destinationViewController as! UINavigationController
            let destinationVC = navVC.topViewController as! ResourceController
           
            let selectedIndex = self.tableView.indexPathForCell(sender as! NewsTableViewCell)
            destinationVC.selectedSkill = skillArray[selectedIndex!.row]
            
            
        }
        if (segue.identifier == "Info") {
            let navVC = segue.destinationViewController as! UINavigationController
            let destinationVC = navVC.topViewController as! InfoViewController
            
            //let selectedIndex = self.tableView.indexPathForCell(sender as NewsTableViewCell)
            //destinationVC.selectedSkill = skillArray[selectedIndex!.row]
            
            //let selectedIndex = (sender as UIButton)
            //destinationVC.selectedSkill = skillArray[selectedIndex.tag]
            
            let button: UIButton = sender as! UIButton
            //println(selectedIndex.tag)
            /*
           */// println(sender!.tag)
            destinationVC.selectedSkill = skillArray[button.tag]

            
            
        }
    }
    

}
