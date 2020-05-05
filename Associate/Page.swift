//
//  Page.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit

// Event containing information
class Page {
    var name: String
    var time: DateRange
    
    struct DateRange {
        var startDate: Date
        var endDate: Date
    }
    
    init(name: String, startDate: Date, endDate: Date) {
        self.name = name
        self.time = DateRange(startDate: startDate, endDate: endDate)
    }
}

extension Date {
    func getYear() -> Int {
        guard let year = (Calendar.current.dateComponents([.year], from: self).year) else { return -1 }
        return year
    }
    func getMonth() -> Int {
        guard let month = (Calendar.current.dateComponents([.month], from: self).month) else { return -1 }
        return month
    }
    func getDay() -> Int {
        guard let day = (Calendar.current.dateComponents([.day], from: self).day) else { return -1 }
        return day
    }
    func getWeekday() -> Int {
        guard let weekday = (Calendar.current.dateComponents([.weekday], from: self).weekday) else { return -1 }
        return weekday
    }
    func getHour() -> Int {
        guard let hour = (Calendar.current.dateComponents([.hour], from: self).hour) else { return -1 }
        return hour
    }
    func getMinute() -> Int {
        guard let minute = (Calendar.current.dateComponents([.minute], from: self).minute) else { return -1 }
        return minute
    }
    func getSecond() -> Int {
        guard let second = (Calendar.current.dateComponents([.second], from: self).second) else { return -1 }
        return second
    }
    func getNanosecond() -> Int {
        guard let nanosecond = (Calendar.current.dateComponents([.nanosecond], from: self).nanosecond) else { return -1 }
        return nanosecond
    }
}


