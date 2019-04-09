//
//  SunTimesService.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class SunTimesService:NSObject {
    
    var location: Location = Location()
   
    
    func fetchSunTimes() {
        let urlString = "https://api.sunrise-sunset.org/json?lat=45&lng=-93"
        let url = URL(string: urlString)
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if let sunTimesData = data {
                let decoder = JSONDecoder()
                let results = try! decoder.decode(Results.self, from: sunTimesData)
                print(results)
            }
        }
        task.resume()
    }
    
    
        func getLocation()->String{
            return location.getCity()
    
        }
}
    



