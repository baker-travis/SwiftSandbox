//
//  ViewController.swift
//  Tinder
//
//  Created by Travis Baker on 10/26/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var push = PFPush()
//        
//        push.setMessage("This is a test")
//        push.sendPushInBackgroundWithBlock({
//            (isSuccessful: Bool!, error: NSError!) -> Void in
//            println(isSuccessful)
//        })
        
        if PFUser.currentUser() != nil {
            println("user logged in")
        } else {
            println("user not logged in")
        }
    }
    @IBAction func signIn(sender: AnyObject) {
        let permissions = ["public_profile"]
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog(error.description)
            } else if user.isNew {
                NSLog(error.description)
            } else {
                NSLog("User logged in through Facebook!")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

