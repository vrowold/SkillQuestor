//
//  PractiveReviewViewController.swift
//  SidebarMenu
//
//  Created by Vincent Rowold on 4/3/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class PracticeReviewViewController: UIViewController{
    
    @IBOutlet weak var sessionTime: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    var skillName: String = String()
    var data: UInt8 = 0
    var skillT: skill = skill()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ModelManager.instance.addJournal(data, skillObject: skillT)
        
        sessionTime.text = "Session time: " + String(data) + " Minute(s)"
        
    }
}
