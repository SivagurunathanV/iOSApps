/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    func doAlert(title:String,message: String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
            self.username.text = ""
            self.password.text = ""
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func Login(sender: AnyObject) {
        
        if username == nil || password == nil  || username.text == "" || password.text == ""{
            doAlert("Error",message: "Please enter the fields")
        }
        else{
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            activityIndicator.startAnimating()
            
            var user = PFUser()
            user.setValue(username.text, forKey: "username")
            user.setValue(password.text, forKey: "password")
            
            PFUser.logInWithUsernameInBackground(username.text, password: password.text, block: { (user, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if user != nil{
                    
                    self.performSegueWithIdentifier("login", sender: self)
                    
                }
                else{
                    
                    
                    if let errorString = error!.userInfo?["error"] as? String {
                        
                        self.doAlert("Failed in Login", message: errorString)
                        
                    }

                }
                
            })
            
        }
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        println(PFUser.currentUser()?.objectId)
        
//        if PFUser.currentUser() != nil {
//            self.performSegueWithIdentifier("login", sender: self)
//        }
    }
    
    @IBAction func Register(sender: AnyObject) {
        
        var user = PFUser()
        user.username = username.text
        user.password = password.text
        
        
        
        user.signUpInBackgroundWithBlock({ (success, error) -> Void in
            
            self.activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if error == nil {
                
                // Signup successful
                
                self.performSegueWithIdentifier("login", sender: self)
                
                
            } else {
                
                if let errorString = error!.userInfo?["error"] as? String {
                    
                    self.doAlert("Failed SignUp", message: errorString)
                
                }
            }
        })
        
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
