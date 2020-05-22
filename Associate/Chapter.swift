//
//  Chapter.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// Supercategory containing pages (events)

class Chapter: ObservableObject {
    @Published var pages: [Page]
    @Published var identifier: String
    
    var anyCancellable: [Int: AnyCancellable?] = [:]
    
    init(pages: [Page], identifier: String) {
        self.pages = pages
        self.identifier = identifier
        
        setUpAnyCancellable()
    }
    
    private func setUpAnyCancellable() {
        for pg in 0 ..< pages.count {
            anyCancellable[pg] = self.pages[pg].objectWillChange.sink(receiveValue: { (_) in
                self.objectWillChange.send()
            })
        }
    }
}
