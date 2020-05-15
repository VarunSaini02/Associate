//
//  Book.swift
//  Associate
//
//  Created by 90304566 on 5/4/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI

class Book {
    var chapters: [Chapter]
    
    init(chapters: [Chapter] = [Chapter]()) {
        self.chapters = chapters
    }
}
