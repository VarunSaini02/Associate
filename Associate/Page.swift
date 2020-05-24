//
//  Page.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// Event containing information
class Page: Identifiable, ObservableObject {
    @Published var identifier: String
    @Published var description: String
    @Published var time: DateRange?
    @Published var images: [Image]?
    @Published var verification: Verification?
    
    var anyCancellable: AnyCancellable? = nil
    
    let id = UUID()
    
    init(identifier: String, description: String = "", startDate: Date? = nil, endDate: Date? = nil, images: [Image]? = nil, verification: Verification? = nil) {
        self.identifier = identifier
        self.description = description
        self.time = DateRange(startDate: startDate, endDate: endDate)
        self.images = images
        
        setUpAnyCancellable()
    }
    
    func setUpAnyCancellable() {
        anyCancellable = self.verification?.objectWillChange.sink(receiveValue: { (_) in
            self.objectWillChange.send()
        })
    }
}

