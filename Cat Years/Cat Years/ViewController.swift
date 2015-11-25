//
//  ViewController.swift
//  Cat Years
//
//  Created by SIVAGURUNATHAN.V on 29/08/15.
//  Copyright (c) 2015 Deva&co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonAge: UITextField!
    
    @IBOutlet var inputAge: UITextField!
    
    @IBOutlet var resultAge: UILabel!
    
    @IBAction func findAge(sender: AnyObject) {
       
        var enteredAge=inputAge.text.toInt()
        
        if enteredAge != nil {
            var calAge = enteredAge!*7
            resultAge.text = "\(calAge)"
        }
        else {
            resultAge.text = "Please enter some valid age"
        }
        
        
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        
        resultAge.text = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

