//
//  ViewController.swift
//  JSONAsyncSwift
//
//  Created by Travis Baker on 10/28/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate {
    
    var parser: NSXMLParser = NSXMLParser()
    
    var posterImageData: UIImage? = nil
    
    var eName = ""

    @IBOutlet weak var posterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url:NSURL = NSURL(string: "http://www.omdbapi.com/?t=The+Avengers&y=&plot=short&r=xml")!
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        
        posterImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://ia.media-imdb.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SX300.jpg")!)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getAPost(sender: AnyObject) {
        parser.parse()
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        //println("Element's name is \(elementName)")
        //println("Element's attributes are \(attributeDict)")
        eName = elementName
        NSLog(eName)
        
        if eName == "movie" {
            println(attributeDict)
            var posterUrl = NSURL(string: "http://ia.media-imdb.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SX300.jpg")
            var posterData = NSData(contentsOfURL: posterUrl!)
            
            posterImageData = UIImage(data: posterData!)
            
            posterImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://ia.media-imdb.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SX300.jpg")!)!)
            
        }
        //NSLog(elementName)
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        //NSLog(string)
        NSLog(eName + ": " + string)
        eName = ""
    }
//
//    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
//        
//    }

}

