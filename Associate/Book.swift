//
//  Book.swift
//  Associate
//
//  Created by 90304566 on 5/4/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class Book: ObservableObject {
    @Published var chapters: [Chapter]
    
    var anyCancellable: [Int: AnyCancellable?] = [:]
    
    init(chapters: [Chapter]) {
        self.chapters = chapters
        
        setUpAnyCancellable()
    }
    
    private func setUpAnyCancellable() {
        for ch in 0 ..< chapters.count {
            anyCancellable[ch] = self.chapters[ch].objectWillChange.sink(receiveValue: { (_) in
                self.objectWillChange.send()
            })
        }
    }
}
