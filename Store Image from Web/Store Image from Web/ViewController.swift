//
//  ViewController.swift
//  Store Image from Web
//
//  Created by SIVAGURUNATHAN.V on 17/10/15.
//  Copyright (c) 2015 Siva Deva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        
//        let url = NSURL(string: "http://img5a.flixcart.com/image/tablet/v/n/6/apple-32-gb-ipad-mini-with-retina-display-and-wi-fi-400x400-imadr69bgvfkkhhx.jpeg")
//        
//        let urlRequest = NSURLRequest(URL: url!)
//        
//        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) {
//            response, data,error in
//            if error != nil {
//                println(error)
//            }
//            else{
//                var displayImage = UIImage(data: data)
////                self.image.image = displayImage
//                
//                var directory:String?
//                
//                var path:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//                
//                if path.count > 0{
//                    directory = path[0] as? String
//                    var savePath = directory! + "/ipad.jpeg"
//                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
//                    
//                    self.image.image = UIImage(named: savePath)
//                    
//                }
//            }
//        }
                
                var directory:String?
                
                var path:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if path.count > 0{
                    directory = path[0] as? String
                    var savePath = directory! + "/ipad.jpeg"
                    println(savePath)
//                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.image.image = UIImage(named: savePath)
                    
                
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

