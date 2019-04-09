//
//  SunTimes.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let results: SunTimes
    
}

struct SunTimes: Decodable {
    let sunrise: String
    let sunset: String

    //Source: https://stackoverflow.com/questions/49675026/coding-key-difficulties-with-json-swift-4-1
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset

    }
}

extension SunTimes {
    
    static let utcDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "hh:mm:ss a"
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df
    }()
    
    static let localDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.calendar = NSCalendar.current
        df.timeZone = TimeZone.current
        df.timeStyle = .medium
        return df
        
    }()

    init(from decoder: Decoder) {
        
        //turn string to local dates
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let sunriseUTCString = try! container.decode(String.self, forKey: CodingKeys.sunrise)
        let sunsetUTCString = try! container.decode(String.self, forKey: CodingKeys.sunset)
    
        
        // convert to timestamp, in UTC
        let sunriseUTCDate = SunTimes.utcDateFormatter.date(from: sunriseUTCString)
        let sunsetUTCDate = SunTimes.utcDateFormatter.date(from: sunsetUTCString)
        
        
        //convert UTC timestamp to local time for device
         sunrise = SunTimes.localDateFormatter.string(from: sunriseUTCDate!)
         sunset = SunTimes.localDateFormatter.string(from: sunsetUTCDate!)

    }
    

}
