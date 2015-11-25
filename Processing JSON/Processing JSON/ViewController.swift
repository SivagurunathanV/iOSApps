//
//  ViewController.swift
//  Processing JSON
//
//  Created by SIVAGURUNATHAN.V on 17/10/15.
//  Copyright (c) 2015 Siva Deva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string:"http://www.telize.com/geoip")!
        
        /**
            1. Method 1 create a URL seesion and use dataTaskwithURL
            2. Create a NSConnection with async mode
        **/
        
//        let session = NSURLSession.sharedSession()
//        
//        let task = session.dataTaskWithURL(url, completionHandler: { (data, response,error) -> Void in
//            if error != nil {
//                println(error)
//            }
//            else{
//                
//                println(data)
//            }
//        })
//        
//        task.resume()
        
        let urlRequest = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if error != nil {
                println(error)
            }
            else{
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                if jsonResult.count > 0{
                    println(jsonResult)
                    
                    if let country=jsonResult["country"] as? String{
                        println(country)
                    }
                }
            }
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

