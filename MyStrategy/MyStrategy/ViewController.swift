//
//  ViewController.swift
//  MyStrategy
//
//  Created by Travis Baker on 11/13/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

protocol Canine {
    func bark() -> Void
}

class ViewController: UIViewController {
    
    class Dog: Canine {
        func bark() {
            println("woof woof")
        }
    }
    
    class Wolf: Canine {
        func bark() {
            println("howl howl")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dog = Dog()
        let wolf = Wolf()
        
        let animals: [Canine] = [dog, wolf]
        // Because they are both canines, they both have the bark function, but behave differently.
        for animal in animals {
            println(animal.bark())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

