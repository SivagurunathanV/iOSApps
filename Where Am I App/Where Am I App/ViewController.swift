//
//  ViewController.swift
//  Where Am I App
//
//  Created by SIVAGURUNATHAN.V on 01/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var manager : CLLocationManager!
    
    @IBOutlet var address: UILabel!
    @IBOutlet var speed: UILabel!
    @IBOutlet var altitude: UILabel!
    @IBOutlet var course: UILabel!
    @IBOutlet var longitude: UILabel!
    @IBOutlet var latitude: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var location:CLLocation = locations[0] as! CLLocation
        self.latitude.text = "\(location.coordinate.latitude)"
        self.longitude.text = "\(location.coordinate.longitude)"
        self.course.text = "\(location.course)"
        self.speed.text = "\(location.speed)"
        self.altitude.text = "\(location.altitude)"
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            if (error != nil) {
                println(error)
            }
            else
            {
                if let p = CLPlacemark(placemark: placemarks[0] as! CLPlacemark){
                    
                    var subThoroughfare:String = ""
                    
                    if (p.subThoroughfare != nil) {
                        
                        subThoroughfare = p.subThoroughfare
                        
                    }
                    
                    self.address.text = "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                }
                
            }
        })
        
        
    }
    


}

