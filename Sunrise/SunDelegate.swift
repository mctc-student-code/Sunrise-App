//
//  SunDelegate.swift
//  Sunrise
//
//  Created by student1 on 4/9/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation

protocol SunDelegate {
    func timesReady(suntimes: SunTimes) -> Void
    //todo deal with errors 
}
