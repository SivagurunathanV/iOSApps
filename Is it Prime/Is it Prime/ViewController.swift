//
//  ViewController.swift
//  Is it Prime
//
//  Created by SIVAGURUNATHAN.V on 11/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var inputNumber: UITextField!
    @IBOutlet var outputLabel: UILabel!
    
    @IBAction func findPrimeOrNot(sender: AnyObject) {
        
//        if inputNumber != nil {
        
        
        println(inputNumber)
        var number = inputNumber.text.toInt()
        
        if number != nil {
        
            if number!  > 0  && number! > 1 && findPrime(number!){
                outputLabel.text = "PRIME"
            }
            else{
                outputLabel.text = "NOT PRIME"
            }
        }
        else {
            outputLabel.text = "Enter Some valid input"
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func findPrime(input:Int) -> (Bool) {
        
        var sq_root = sqrt(Double(input))
        
        for var i:Int = 2 ; i <= Int(floor(sq_root)) ; i=i+1{
            if input % i == 0 {
                return false
            }
        }
        
        return true
    }


}

