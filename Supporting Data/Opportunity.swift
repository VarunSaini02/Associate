//
//  OppsData.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct Opportunity: Identifiable {
    let id = UUID()
    var location: String
    var spotsLeft: Int
    var name: String
    var description: String
}

class OpportunityList: Identifiable, ObservableObject {
    let id = UUID()
    @Published var opps: [Opportunity]
    
    init(opps: [Opportunity]) {
        self.opps = opps
    }
}

#if DEBUG
let testOpportunityList = OpportunityList(opps: [
    Opportunity(location: "Chanhassen, MN", spotsLeft: 15, name: "Feed My Starving Children", description: "This is test data where I will insert actual text once we are able to collect it"),
    Opportunity(location: "Eden Prairie, MN", spotsLeft: 12, name: "EPHS", description: "This is test data where I will insert actual text once we are able to collect it"),
    Opportunity(location: "Eden Prairie, MN", spotsLeft: 13, name: "Prop Shop", description: "This is test data where I will insert actual text once we are able to collect it")
])
#endif
