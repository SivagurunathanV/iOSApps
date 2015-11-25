//
//  ViewController.swift
//  Weather App
//
//  Created by SIVAGURUNATHAN.V on 18/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var enteredCity: UITextField!
    
    @IBOutlet var outputWeatherLabel: UILabel!
    
    
    @IBAction func findWeather(sender: AnyObject) {
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + enteredCity.text.capitalizedString.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        var urlError = false
        var weatherContent = ""
        if url != nil {
             var task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
                (data,response,error) in
            if error == nil{
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                var urlContentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
                if urlContentArray.count > 0 {
                    var weatherContentArray = urlContentArray[1].componentsSeparatedByString("</span>")
                    weatherContent = weatherContentArray[0] as! String
                    weatherContent = weatherContent.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                    }
                }
                else
                {
                    urlError = true
                }
                
                dispatch_async(dispatch_get_main_queue()){
                    println(weatherContent)                    
                    if urlError {
                        self.outputWeatherLabel.text = "Please enter a valid city name"
                    }
                    else {
                        self.outputWeatherLabel.text = weatherContent
                    }
                }

            }

            
            task.resume()
            
        }
        
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.enteredCity.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    


}

