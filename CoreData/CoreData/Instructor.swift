//
//  Instructor.swift
//  CoreData
//
//  Created by Travis Baker on 10/15/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import Foundation
import CoreData

class Instructor: NSManagedObject {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var age: NSNumber
    @NSManaged var course: NSSet

}
