//
//  ViewController.swift
//  WebView Demo
//
//  Created by SIVAGURUNATHAN.V on 17/10/15.
//  Copyright (c) 2015 Siva Deva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSString(string: "http://www.google.com")
        
        let url = NSURL(fileURLWithPath: path as String)
        
         println("\(url)")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        println("\(url)")
        
        println("\(urlRequest)")
        webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

