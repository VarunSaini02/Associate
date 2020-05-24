//
//  OppsData.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct OppsData: Identifiable {
    let id = UUID()
    var location: String
    var spotsLeft: Int
    var name: String
    var description: String
}

class OppsDataContainer: Identifiable, ObservableObject {
    let id = UUID()
    @Published var opps: [OppsData]
    
    init(opps: [OppsData]) {
        self.opps = opps
    }
}

#if DEBUG
let testData = OppsDataContainer(opps: [
    OppsData(location: "Chanhassen, MN", spotsLeft: 15, name: "Feed My Starving Children", description: "This is test data where I will insert actual text once we are able to collect it"),
    OppsData(location: "Eden Prairie, MN", spotsLeft: 12, name: "EPHS", description: "This is test data where I will insert actual text once we are able to collect it"),
    OppsData(location: "Eden Prairie, MN", spotsLeft: 13, name: "Prop Shop", description: "This is test data where I will insert actual text once we are able to collect it")
])
#endif
