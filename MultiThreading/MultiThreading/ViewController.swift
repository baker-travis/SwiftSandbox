//
//  ViewController.swift
//  MultiThreading
//
//  Created by Travis Baker on 11/6/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundQueue: NSOperationQueue? = nil

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        backgroundQueue = NSOperationQueue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func runOnBackgroundQueue(sender: AnyObject) {
        backgroundQueue?.addOperationWithBlock({
            println("sleeping")
            NSThread.sleepForTimeInterval(5)
            println("done sleeping")
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                //Must reference self here.
                self.myLabel.text = "I slept"
            })
        })
    }


}
