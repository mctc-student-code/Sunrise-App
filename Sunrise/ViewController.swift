//
//  ViewController.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SunDelegate {
    func timesReady(suntimes: SunTimes) {
        if sunriseLabel.text != nil {
            sunriseLabel.text = sunTimes.results.sunrise
        }
        
    }
    
    
    var sunTimes: Results!
    var location = SunTimesService()

    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
   // var location: SunTimesService = SunTimesService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sunriseLabel.text != nil {
            sunriseLabel.text = sunTimes.results.sunrise
        }
        
    }


}

