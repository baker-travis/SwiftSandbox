//
//  ViewController.swift
//  MultiThreadingGCD
//
//  Created by Travis Baker on 11/10/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var queue: dispatch_queue_t?

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        queue = dispatch_queue_create("com.bakercreations.testQueue", DISPATCH_QUEUE_CONCURRENT)
    }

    @IBAction func doAsyncRequest(sender: AnyObject) {
        dispatch_async(queue, { () -> Void in
            println("start sleep")
            NSThread.sleepForTimeInterval(5)
            println("end sleep")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.myLabel.text = "I slept"
            })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
