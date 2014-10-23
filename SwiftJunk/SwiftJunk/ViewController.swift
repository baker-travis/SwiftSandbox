//
//  ViewController.swift
//  SwiftJunk
//
//  Created by Travis Baker on 9/23/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myBlurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myBlurView.alpha = 0
        myBlurView.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func hideAllViews(sender: AnyObject) {
        
        UIView.animateWithDuration(1, delay: 0, options: .AllowUserInteraction | .BeginFromCurrentState, animations: {
                self.myBlurView.center.y = self.myBlurView.frame.height * 2
            }, completion: {
                (Bool) in self.myBlurView.hidden = true
        })
    }
    
    @IBAction func changealpha(sender: AnyObject) { 
        
        myBlurView.hidden = false
        if (myBlurView.alpha == 1) {
            UIView.animateWithDuration(3, delay: 0, options: .AllowUserInteraction | .BeginFromCurrentState, animations: {
                self.myBlurView.alpha = 0.5
                }, completion: {
                    (Bool) in
            })
        } else {
            UIView.animateWithDuration(3, delay: 0, options: .AllowUserInteraction | .BeginFromCurrentState, animations: {
                self.myBlurView.alpha = 1
                }, completion: {
                    (Bool) in
            })
        }
        
    }
    
    @IBAction func changeVisibility(sender: AnyObject) {
        myBlurView.center.y = self.myBlurView.frame.height * 2
        myBlurView.hidden = false
        
        UIView.animateWithDuration(1, delay: 0, options: .AllowUserInteraction | .BeginFromCurrentState,  animations: {
            self.myBlurView.center.y = self.myBlurView.frame.height / 2
            }, completion: {
                finished in
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

