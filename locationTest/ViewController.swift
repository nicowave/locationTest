//
//  ViewController.swift
//  locationTest
//
//  Created by Nicolas Roldos on 3/31/15.
//  Copyright (c) 2015 Nicolas Roldos. All rights reserved.
//

import UIKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latLab: UILabel!
    @IBOutlet weak var longLab: UILabel!
    @IBOutlet weak var hozLab: UILabel!
    @IBOutlet weak var altLab: UILabel!
    //@IBOutlet weak var vertLab: UILabel!
    @IBOutlet weak var distLab: UILabel!
    @IBOutlet weak var speedLab: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startmylocation: CLLocation!
    
    @IBAction func resetCalcs(sender: AnyObject) {
        println(locationManager.location)
        startmylocation = nil
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startmylocation = nil
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        //latLab.text = String(format: "%.4f", latestLocation.coordinate.latitude)
        //longLab.text = String(format: "%.4f", latestLocation.coordinate.longitude)
        hozLab.text = String(format: "%.1f", latestLocation.horizontalAccuracy)
        //altLab.text = String(format: "%.1f", latestLocation.altitude)
        //vertLab.text = String(format: "%.1f", latestLocation.verticalAccuracy)
        
        if startmylocation == nil {
            startmylocation = latestLocation as! CLLocation
            
        }
        
        var distanceBetween: CLLocationDistance = latestLocation.distanceFromLocation(startmylocation)
        var distanceBetweenFeet = distanceBetween * 3.2808
        distLab.text = String(format: "%.1f", distanceBetweenFeet)
        
        var travelspeed: CLLocationSpeed = latestLocation.speed
        var travelspeedmph = (travelspeed * 2.236909090896)
        speedLab.text = String(format: "%.1f", travelspeedmph)
        println("Your velocity is " + "estimated " + "\(speedLab.text)")
        
    }
    
    
    
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!)    {
        
    }
}

