//
//  ModelManager.swift
//  DataBaseDemo
//
//  Created by Krupa-iMac on 05/08/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class var instance: ModelManager {
        sharedInstance.database = FMDatabase(path: Util.getPath("sqdatabase.sql"))
        var path = Util.getPath("sqdatabase.sql")
            //54D70B97-F386-4746-9A69-692E339668B8
        println("path : \(path)")
        return sharedInstance
    }
    
    func addSkill(userSkill: UserSkill) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO user_skills (userid, skillid) VALUES (?, ?)", withArgumentsInArray: [1, userSkill.skillid])
        sharedInstance.database!.close()
        return isInserted
    }
   /*
    func updateStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE StudentInfo SET student_name=? WHERE student_rollno=?", withArgumentsInArray: [studentInfo.studentName, studentInfo.studentRollNo])
        sharedInstance.database!.close()
        return isUpdated
    }
    */
    
    func deleteSkill(userSkill: UserSkill) -> Bool {
        sharedInstance.database!.open()
        let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM user_skills WHERE skillid=?", withArgumentsInArray: [userSkill.skillid])
        sharedInstance.database!.close()
        return isDeleted
    }

    func getAllSkills() {
        sharedInstance.database!.open()
        var resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM user_skills", withArgumentsInArray: nil)
        var useridColumn: String = "userid"
        var skillidColumn: String = "skillid"
        if (resultSet != nil) {
            while resultSet.next() {
                println("userid : \(resultSet.stringForColumn(useridColumn))")
                println("skillid : \(resultSet.stringForColumn(skillidColumn))")
            }
        }
        sharedInstance.database!.close()
    }
    
}
