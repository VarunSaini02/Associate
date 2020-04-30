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
    //var time: DateRange
    
    init(name: String) {
        self.name = name
    }
}

struct DateRange {
    var startDate: EventDate
    var endDate: EventDate
}

struct EventDate {
    
}
