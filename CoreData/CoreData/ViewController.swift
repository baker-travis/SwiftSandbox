//
//  ViewController.swift
//  CoreData
//
//  Created by Travis Baker on 10/14/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
    }()
    
    var tableData: [Course]? = nil 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func createNewNSManagedObject(sender: AnyObject) {
        
        let newCourse = NSEntityDescription.insertNewObjectForEntityForName("Course", inManagedObjectContext: managedObjectContext!) as Course
        
        newCourse.courseName = "iOS Application Development"
        newCourse.building = "Smith"
        newCourse.courseCode = "CIT465"
        newCourse.instructor = NSEntityDescription.insertNewObjectForEntityForName("Instructor", inManagedObjectContext: managedObjectContext!) as Instructor
        newCourse.instructor.firstName = "Brother"
        newCourse.instructor.lastName = "Barney"
        newCourse.instructor.age = 50
        newCourse.roomNumber = 413
        
        NSLog(newCourse.description)
        var error: NSErrorPointer = nil
        if (!(managedObjectContext!.save(error)) ) {
            //This is if the save fails
            NSLog("Save Failed! \(error)")
        }
    }
    
    
    @IBAction func fetchObjects(sender: AnyObject) {
        let fetchRequest = NSFetchRequest(entityName: "Course")
        
        tableData = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Course]
        
        if tableData != nil {
            for course in tableData! {
                println(course.courseName)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

