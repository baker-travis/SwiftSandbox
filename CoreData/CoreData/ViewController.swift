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
    
    @IBOutlet weak var indexField: UITextField!
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
    }()
    
    var tableData: [Course]?

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
        newCourse.instructor.age = 40
        newCourse.roomNumber = 413
        
        NSLog(newCourse.description)
        var error: NSErrorPointer = nil
        if (!(managedObjectContext!.save(error)) ) {
            //This is if the save fails
            NSLog("Save Failed! \(error)")
        }
    }
    
    @IBAction func changeACourse(sender: AnyObject) {
        if tableData != nil {
            if let length = tableData?.count {
                if length > indexField.text.toInt()! {
                    tableData![indexField.text.toInt()!].courseName = "Mobile Application Development"
                    tableData![indexField.text.toInt()!].courseCode = "CIT 261"
                    println("Changed course at index" + indexField.text)
                }
            }
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
    
    @IBAction func deleteACourse(sender: AnyObject) {
        for course in tableData! {
            if course.courseCode == indexField.text {
                managedObjectContext?.deleteObject(course)
                println("deleted a course")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

