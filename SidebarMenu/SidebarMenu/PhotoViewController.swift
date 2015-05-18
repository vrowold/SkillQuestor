//
//  PhotoViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var timer = NSTimer()
    var startTime = NSTimeInterval()
    var data: String = "hjkdfshjklsdgfhj"
    var data2: UInt8 = 0
    var skillT: skill = skill()
    
    @IBOutlet weak var skillLabel: UILabel!

    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    @IBOutlet var displayTimeLabel: UILabel!

    @IBAction func start(sender: AnyObject) {
        timer.fire()
        if !timer.valid {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        var stoppedTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var totalTime: NSTimeInterval = stoppedTime - startTime
        
        
        timer.invalidate()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillLabel.text = data + " Session"
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        data2 = minutes
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let hours = UInt8(elapsedTime / 360)
        elapsedTime -= (NSTimeInterval(hours) * 360)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strHours = String(hours)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == "Timer View") {
            let navVC = segue.destinationViewController as! PracticeReviewViewController
            
            ModelManager.instance.addJournal((data2 + 1), skillObject: skillT)
            
            navVC.data =
                data2 +
            1
            navVC.skillName = data.lowercaseString
           
            navVC.skillT = skillT
            
        }
        
    }


}
