//
//  DatabaseTestController.swift
//  SidebarMenu
//
//  Created by Vincent Rowold on 4/3/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class DatabaseTestController: UIViewController{
    
    var skill: UserSkill = UserSkill()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func databaseButton(sender: AnyObject) {
        skill.skillid = 1
       // ModelManager.instance.showResources(skill)
    }
  
    

}