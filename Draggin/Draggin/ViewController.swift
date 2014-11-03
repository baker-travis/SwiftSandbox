//
//  ViewController.swift
//  Draggin
//
//  Created by Travis Baker on 10/29/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var xFromCenter: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var label: UILabel = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50, 200, 100))
        label.text = "dragMe!"
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        label.addGestureRecognizer(gesture)
        label.userInteractionEnabled = true
    }
    
    func wasDragged(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translationInView(self.view)
        
        var label = gesture.view!
        
        xFromCenter += translation.x
        
        var scale = min(100 / abs(xFromCenter), 1)
        
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y) //+ translation.y)
        
        gesture.setTranslation(CGPointZero, inView: self.view)
        
        var rotation: CGAffineTransform = CGAffineTransformMakeRotation(xFromCenter / 200)
        
        var stretch: CGAffineTransform = CGAffineTransformScale(rotation, scale, scale)
        
        label.transform = stretch
        
        if label.center.x < 100 {
            println("not chosen");
        } else if label.center.x > self.view.bounds.width - 100 {
            println("chosen");
        }
        
        if gesture.state == UIGestureRecognizerState.Ended {
            label.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
            
            rotation = CGAffineTransformMakeRotation(0)
            
            scale = 1 //max(abs(xFromCenter) / 100, 1)
            
            stretch = CGAffineTransformScale(rotation, scale, scale)
            
            label.transform = stretch
            
            xFromCenter = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

