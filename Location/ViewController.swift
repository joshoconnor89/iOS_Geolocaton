//
//  ViewController.swift
//  Location
//
//  Created by Neil Smyth on 11/7/14.
//  Copyright (c) 2014 Neil Smyth. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var horizontalAccuracy: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var verticalAccuracy: UILabel!
    @IBOutlet weak var distance: UILabel!

    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil

    }
    
    @IBAction func resetDistance(sender: AnyObject) {
        startLocation = nil
    }

    func locationManager(manager: CLLocationManager!,
                    didUpdateLocations locations: [AnyObject]!)
    {
        var latestLocation: AnyObject = locations[locations.count - 1]

        latitude.text = String(format: "%.4f", 
                             latestLocation.coordinate.latitude)
        longitude.text = String(format: "%.4f",    
                             latestLocation.coordinate.longitude)
        horizontalAccuracy.text = String(format: "%.4f", 
                             latestLocation.horizontalAccuracy)
        altitude.text = String(format: "%.4f", 
                             latestLocation.altitude)
        verticalAccuracy.text = String(format: "%.4f", 
                             latestLocation.verticalAccuracy)


        if startLocation == nil {
            startLocation = latestLocation as CLLocation
        }

        var distanceBetween: CLLocationDistance = 
            latestLocation.distanceFromLocation(startLocation)

        distance.text = String(format: "%.2f", distanceBetween)
    }

    func locationManager(manager: CLLocationManager!,
             didFailWithError error: NSError!) {

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

