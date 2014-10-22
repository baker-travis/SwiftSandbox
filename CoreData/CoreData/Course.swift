//
//  Course.swift
//  CoreData
//
//  Created by Travis Baker on 10/15/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import Foundation
import CoreData

class Course: NSManagedObject {

    @NSManaged var building: String
    @NSManaged var roomNumber: NSNumber
    @NSManaged var courseCode: String
    @NSManaged var courseName: String
    @NSManaged var instructor: Instructor

}
