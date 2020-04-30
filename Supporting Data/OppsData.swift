//
//  OppsData.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct OppsData: Identifiable{
    var id: Int
    var location: String;
    var spotsLeft: Int;
    var name: String;
   
    }

#if DEBUG
let testData = [
    OppsData(id: 0, location: "Eden Prairie, MN", spotsLeft: 15, name: "Feed My Starving Children"),
    OppsData(id: 1, location: "None", spotsLeft: 12, name: "None")
    
]
#endif
