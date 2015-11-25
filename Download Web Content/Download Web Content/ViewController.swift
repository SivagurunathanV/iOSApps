//
//  ViewController.swift
//  Download Web Content
//
//  Created by SIVAGURUNATHAN.V on 18/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webContent: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = NSURL(string: "http://www.facebook.com")
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            
            (data,response,error) in
            
            if error == nil {
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                dispatch_async(dispatch_get_main_queue()){
                    self.webContent.loadHTMLString(urlContent! as String, baseURL: nil)
                }
            }
            
        }
        
        task.resume()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

