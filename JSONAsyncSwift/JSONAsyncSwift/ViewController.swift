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
    
    var eName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url:NSURL = NSURL(string: "http://api.cbssports.com/fantasy/sports")!
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        //parser.parse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func post(params : Dictionary<String, String>, url : String, method : String, postCompleted : (succeeded: Bool, msg: String) -> ()) {
        let theURL = NSURL(string: url)
        var request = NSMutableURLRequest(URL: theURL!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = method
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            NSLog(data.description)
//            println("Response: \(response)")
//            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
//            println("Body: \(strData)")
//            var err: NSError?
//            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
//            
//            var msg = "No message"
//            
//            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
//            if(err != nil) {
//                println(err!.localizedDescription)
//                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
//                println("Error could not parse JSON: '\(jsonStr)'")
//                postCompleted(succeeded: false, msg: "Error")
//            }
//            else {
//                // The JSONObjectWithData constructor didn't return an error. But, we should still
//                // check and make sure that json has a value using optional binding.
//                if let parseJSON = json {
//                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
//                    if let success = parseJSON["success"] as? Bool {
//                        println("Succes: \(success)")
//                        postCompleted(succeeded: success, msg: "Logged in.")
//                    }
//                    return
//                }
//                else {
//                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
//                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
//                    println("Error could not parse JSON: \(jsonStr)")
//                    postCompleted(succeeded: false, msg: "Error")
//                }
//            }
        })
        
        task.resume()
    }
    
    @IBAction func getAPost(sender: AnyObject) {
//        post(["":""], url: "http://api.cbssports.com/fantasy/sports?version=3.0", method: "GET", postCompleted: { (succeeded: Bool, msg: String) -> () in
//            NSLog(msg)
//        })
        parser.parse()
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        //println("Element's name is \(elementName)")
        //println("Element's attributes are \(attributeDict)")
        eName = elementName
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

