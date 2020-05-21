//
//  OppsData.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct OppsData: Identifiable, Hashable{
    var id: Int
    var location: String;
    var spotsLeft: Int;
    var name: String;
    var description: String;
    
}

#if DEBUG
let testData = [
    OppsData(id: 0, location: "Chanhassen, MN", spotsLeft: 15, name: "Feed My Starving Children", description: "This is test data where I will insert actual text once we are able to collect it"),
    OppsData(id: 1, location: "Eden Prairie, MN", spotsLeft: 12, name: "EPHS", description: "This is test data where I will insert actual text once we are able to collect it"),
    OppsData(id: 2, location: "Eden Prairie, MN", spotsLeft: 13, name: "Prop Shop", description: "This is test data where I will insert actual text once we are able to collect it")
    
]
#endif
