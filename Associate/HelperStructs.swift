//
//  HelperStructs.swift
//  Associate
//
//  Created by 90304566 on 5/23/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

extension Color {
    static let offGray: [Color] = [
        Color(red: 110 / 255, green: 110 / 255, blue: 110 / 255),
        Color(red: 120 / 255, green: 120 / 255, blue: 120 / 255),
        Color(red: 130 / 255, green: 130 / 255, blue: 130 / 255),
        Color(red: 140 / 255, green: 140 / 255, blue: 140 / 255),
        Color(red: 150 / 255, green: 150 / 255, blue: 150 / 255),
        Color(red: 160 / 255, green: 160 / 255, blue: 160 / 255),
        Color(red: 170 / 255, green: 170 / 255, blue: 170 / 255),
        Color(red: 180 / 255, green: 180 / 255, blue: 180 / 255),
        Color(red: 190 / 255, green: 190 / 255, blue: 190 / 255),
        Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255),
        Color(red: 210 / 255, green: 210 / 255, blue: 210 / 255),
        Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
    ]
}

// Center items in a form with Spacer()
struct CenterInForm: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}

// Make CenterInForm a View-modifying function
extension View {
    func centerInForm() -> some View {
        self.modifier(CenterInForm())
    }
}

// GridStack struct — use for building UI
struct GridStack<T: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> T
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

// Used in Profile
struct Name {
    let firstName: String
    let lastName: String
    let fullName: String
    
    init(_ first: String, _ last: String) {
        self.firstName = first
        self.lastName = last
        self.fullName = first + " " + last
    }
    
    init(_ full: String) {
        self.fullName = full
        self.firstName = full.components(separatedBy: " ")[0]
        self.lastName = full.components(separatedBy: " ")[1]
    }
}


// Used in Profile
struct CPIndex {
    let ch: Int
    let pg: Int
}

// Used in Page
struct DateRange {
    let startDate: Date?
    let endDate: Date?
}

// Used to extend Date objects for in Page
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


// Used for Verification Contact
struct Contact {
    var name: Name?
    var email: String?
    var phone: PhoneNumber?
    
    init(name: Name? = nil, email: String? = nil, phone: PhoneNumber? = nil) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}

// Used for Verification Contact's Phone Number
struct PhoneNumber {
    var areaCode: Int
    var prefix: Int
    var lineNumber: Int
    var unformatted: Int
    
    init(_ areaCode: Int, _ prefix: Int, _ lineNumber: Int) {
        self.areaCode = areaCode
        self.prefix = prefix
        self.lineNumber = lineNumber
        
        unformatted = (areaCode * 10000000) + (prefix * 10000) + lineNumber
    }
}



