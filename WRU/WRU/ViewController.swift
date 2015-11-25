//
//  ViewController.swift
//  WRU
//
//  Created by SIVAGURUNATHAN.V on 18/10/15.
//  Copyright (c) 2015 Siva Deva. All rights reserved.
//


import UIKit
import MapKit

var annotation = MKPointAnnotation()

class ViewController: UIViewController,CLLocationManagerDelegate {

    var manager:CLLocationManager!
    
    var url = "http://localhost:8000/locations"
    
    @IBOutlet var map: MKMapView!
    
    
    class Location:NSObject{
        
        var name:NSString = ""
        var latitude:NSString = ""
        var longitude:NSString = ""
        
        init(JSONString: String) {
            super.init()
            var error = NSError?()
            
            let JSONData = JSONString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            
            let JSONDictionary:NSDictionary = NSJSONSerialization.JSONObjectWithData(JSONData!, options: nil, error: &error) as! NSDictionary
            
            for (key,val) in JSONDictionary{
                let keyName = key as! String
                let keyValue = val as! String
                
                if self.respondsToSelector(NSSelectorFromString(keyName)){
                    self.setValue(keyValue, forKey: keyName)
                }
                
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        var uilpr = UILongPressGestureRecognizer(target: self, action: "addLocation:")
        uilpr.minimumPressDuration = 1
        self.map.addGestureRecognizer(uilpr)
        
        var url_end_point = NSURL(string: url)!
        
        var request:NSURLRequest = NSURLRequest(URL: url_end_point)
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if error != nil {
                println(error)
            }
            else
            {
                if let json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
                {
                    println(json)
                    let locations:NSArray = json["locations"] as! NSArray
                        println(json.count)
                    for item in locations{
                        println(item)
                        var location:Location = Location(JSONString: item as! String)
                        println(location.latitude)
                        println(location.longitude)
                       self.setLocation(location.latitude, longitude: location.longitude,name: location.name)
                    }
                }
                    
            }
    }
}
    
    
    func setLocation(latitude: NSString,longitude: NSString,name: NSString)-> Void{
    
        
        var location = CLLocationCoordinate2D(latitude: latitude.doubleValue, longitude: longitude.doubleValue)
        var locationAddress = CLLocation(latitude: latitude.doubleValue, longitude: longitude.doubleValue)
        var longDelta = 0.05
        var latDelta = 0.05
        var span = MKCoordinateSpanMake(latDelta, longDelta)
        var region = MKCoordinateRegionMake(location, span)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
       // annotation.title = findAddress(locationAddress)
         annotation.title = name as String
        
        annotation.subtitle = "test"
       
        self.map.addAnnotation(annotation)
      //  self.map.setRegion(region, animated: true)
    }
    
    
    func addLocation(gesture : UIGestureRecognizer){
    
        if gesture.state == UIGestureRecognizerState.Began {
        
            var touchPoint = gesture.locationInView(self.map)
            
            var newCoordinate = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            setLocation("\(newCoordinate.latitude)", longitude: "\(newCoordinate.longitude)", name: "You")
            
//            var newLocation = CLLocationCoordinate2D(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
//            
//            var locationAddress = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
//            
//            annotation.coordinate = newCoordinate
//            
//            annotation.title = findAddress(locationAddress)
//            
//            self.map.addAnnotation(annotation)
            
        }
    }
    
    func findAddress(location: CLLocation) -> String{
    
        var address = ""
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placeMark, error) -> Void in
            if error != nil {
                println(error)
            }
            else {
                if let p = CLPlacemark(placemark: placeMark[0] as! CLPlacemark){
                    address = "\(p.thoroughfare) \(p.subAdministrativeArea)"
                }
                
            }

        })
        
        return address
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userlocation:CLLocation = locations[0] as! CLLocation
        
        var latitude = userlocation.coordinate.latitude
        
        var longitude = userlocation.coordinate.longitude
        
        
//        var latDelta:CLLocationDegrees = 0.05
//        
//        var longDelta:CLLocationDegrees = 0.05
//        
//        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
//        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
//        
//        self.map.setRegion(region, animated: false)
        
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

