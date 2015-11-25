//
//  SecondViewController.swift
//  To Do List
//
//  Created by SIVAGURUNATHAN.V on 18/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var inputItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.inputItem.delegate = self
    }
    
    @IBAction func addAnItem(sender: AnyObject) {
        todoListArray.append(inputItem.text)
        inputItem.text = ""
        NSUserDefaults.standardUserDefaults().setObject(todoListArray, forKey: "todoListArray")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    


}

