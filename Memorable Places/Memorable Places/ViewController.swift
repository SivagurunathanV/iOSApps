//
//  ViewController.swift
//  Memorable Places
//
//  Created by SIVAGURUNATHAN.V on 01/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import MapKit


var address:String = ""


class ViewController: UIViewController,CLLocationManagerDelegate {
    

    @IBOutlet var map: MKMapView!
    
    var manager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate=self
        manager.desiredAccuracy=kCLLocationAccuracyBest
        
         var tapAnnotaion = MKPointAnnotation()
        
        if tappedPlace == -1 {
            manager.requestAlwaysAuthorization()
            manager.startUpdatingLocation()
            self.map.removeAnnotation(tapAnnotaion)
        
        }
        else {
            
            var tappedLatitude = NSString(string: places[tappedPlace]["latitude"]!).doubleValue
            var tappedLongitude = NSString(string: places[tappedPlace]["longitude"]!).doubleValue
            
           var tappedLocation = CLLocationCoordinate2D(latitude: tappedLatitude, longitude: tappedLongitude)
        
            var tappedLatitudeDelta = 0.05
            var tappedLongitudeDelta = 0.05
            
            var span = MKCoordinateSpanMake(tappedLatitudeDelta, tappedLongitudeDelta)
            var region = MKCoordinateRegionMake(tappedLocation, span)
            
            tapAnnotaion.coordinate = tappedLocation
            tapAnnotaion.title = places[tappedPlace]["address"]
            
            self.map.addAnnotation(tapAnnotaion)
            self.map.setRegion(region, animated: true)
        }
        
        
        
        var uilpr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpr.minimumPressDuration = 1
        
        self.map.addGestureRecognizer(uilpr)
        
//        for key in NSUserDefaults.standardUserDefaults().dictionaryRepresentation().keys {
//            NSUserDefaults.standardUserDefaults().removeObjectForKey(key.description)
//        }
    }
    
    func action(gestureRecongnizer:UIGestureRecognizer){
        
        if gestureRecongnizer.state == UIGestureRecognizerState.Began {
        
        var touchPoint = gestureRecongnizer.locationInView(self.map)
        
        var newCoordinate = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(location , completionHandler: { (placeMarks, error) -> Void in
                if error != nil {
                    println(error)
                }
                else {
                    if let p=CLPlacemark(placemark: placeMarks[0] as! CLPlacemark){
                        address = "\(p.thoroughfare) \(p.subAdministrativeArea)"
                    }
                    
                }
            })
            
            places.append(["address":address,"latitude" : "\(newCoordinate.latitude)","longitude" : "\(newCoordinate.longitude)"])
        //listOfPlaces.append(address)
        NSUserDefaults.standardUserDefaults().setObject(places, forKey: "places")
            
            var annotation = MKPointAnnotation()
            
            annotation.coordinate = newCoordinate
            
            annotation.title = address
            
            self.map.addAnnotation(annotation)



        }

    
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation=locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var location = CLLocationCoordinate2DMake(latitude, longitude)
        var longDelta:CLLocationDegrees = 0.05
        var latDelta:CLLocationDegrees = 0.05
        var span = MKCoordinateSpanMake(latDelta, longDelta)
        var region = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

