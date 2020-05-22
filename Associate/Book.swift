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

    init(chapters: [Chapter]) {
        self.chapters = chapters
    }
}
