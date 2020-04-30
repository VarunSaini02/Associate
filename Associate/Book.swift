//
//  Book.swift
//  Associate
//
//  Created by 90304566 on 4/29/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit

// Aspect of profile containing chapters (supercategories)
class Book {
    var chapters: [Chapter]
    
    init(chapters: [Chapter]) {
        self.chapters = chapters
    }
}
