//
//  Time.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct Time {
    let seconds: TimeInterval
    let minutes: TimeInterval
    let hours: TimeInterval
    
    var timeInterval: TimeInterval {
        seconds
    }
    
    init(seconds: TimeInterval) {
        self.seconds = seconds
        self.minutes = seconds / 60
        self.hours = seconds / 60 / 60
    }
    
    init(minutes: TimeInterval) {
        self.seconds = minutes * 60
        self.minutes = minutes
        self.hours = minutes / 60
    }
    
    init(hours: TimeInterval) {
        self.seconds = hours * 60 * 60
        self.minutes = hours * 60
        self.hours = hours
    }
    
}
