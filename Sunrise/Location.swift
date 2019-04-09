//
//  Location.swift
//  Sunrise
//
//  Created by Guled Ali on 4/9/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
class Location: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
  
  //  var geoCoder =  CLGeocoder()
    var city: String = ""
    
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
      
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locations.first != nil {
            let userLocation:CLLocation = locations.first!
            self.locationManager.stopUpdatingLocation()
            
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks, error)-> Void in
                if placemarks != nil{
                    if placemarks!.count > 0{
                        let placemark = placemarks![0]
                        self.city = placemark.locality!
                        print(self.city)
                        
                    }
                }
            })
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func getCity()->String{
        return city
    }
}
