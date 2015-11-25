//
//  ViewController.swift
//  Map Demo
//
//  Created by SIVAGURUNATHAN.V on 23/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationMangager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        locationMangager.delegate = self
        locationMangager.desiredAccuracy - kCLLocationAccuracyBest
        locationMangager.requestWhenInUseAuthorization()
        locationMangager.startUpdatingLocation()
//        
//        
//        var uilpg=UILongPressGestureRecognizer(target: self, action: "action:")
//        
//        uilpg.minimumPressDuration = 0.5
//        
//        map.addGestureRecognizer(uilpg)
    }

//    
//    func action(gestureRecong : UIGestureRecognizer){
//        
//        println("gesture")
//    
//        var touchPoint = gestureRecong.locationInView(self.map)
//        
//        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
//        
//        var annotation = MKPointAnnotation()
//        
//        annotation.coordinate = newCoordinate
//        
//        annotation.title = "New Place to visit"
//        
//        map.addAnnotation(annotation)
//        
//    
//    }
//    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        println("HI")
        
        println(locations)
        
        var userlocation:CLLocation = locations[0] as! CLLocation
        
        var latitude = userlocation.coordinate.latitude
        
        var longitude = userlocation.coordinate.longitude
        
        
        var latDelta:CLLocationDegrees = 0.05
        
        var longDelta:CLLocationDegrees = 0.05
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: false)
        
        var address: String = ""
        
        var pincode : String = ""
        
        CLGeocoder().reverseGeocodeLocation(userlocation, completionHandler: { (placemarks, error) -> Void in
            
            if (error != nil){
                println(error)
            }
            else{
            
                if let p=CLPlacemark(placemark: placemarks[0] as! CLPlacemark){
                    
                    var subThrought:String = ""
                    if p.subThoroughfare != nil {
                        subThrought = "\(p.subThoroughfare)"
                    }
                    
                    address = subThrought + "\(p.thoroughfare) \(p.subLocality) \(p.subAdministrativeArea)"
                    pincode = "\(p.postalCode) \(p.country)"
                
                }
                
            }
        })
        
        
        var annotations = MKPointAnnotation()
        
        annotations.coordinate = location
        
//        annotations.title = "Im started moving"
//        
//        annotations.subtitle = "moving"
        
        annotations.title = address
        
        annotations.subtitle = pincode
        
        self.map.addAnnotation(annotations)
        
        

        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

