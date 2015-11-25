//
//  ViewController.swift
//  Core Data Usage
//
//  Created by SIVAGURUNATHAN.V on 10/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var appDelgate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDelgate.managedObjectContext!
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("UserDetails", inManagedObjectContext: context) as! NSManagedObject
//        newUser.setValue("guru", forKey: "username")
//        
//        newUser.setValue("pass1", forKey: "password")
//        
//        context.save(nil)

        var request = NSFetchRequest(entityName: "UserDetails")
        
        request.predicate = NSPredicate(format: "username =%@", "siva")
        
        request.returnsObjectsAsFaults = false
        
        var results = context.executeFetchRequest(request, error: nil)
        
       // println(results)
        
        
        if results?.count > 0 {
            
            
            for result:AnyObject in results! {
                if let p = result.valueForKey("username") as? String{
                    println(p)
                    
                    result.setValue("password", forKey: "password")
                    
                    println(result.password)
                }
            }
            
            context.save(nil)
        }
        else{
            println("No results")
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

