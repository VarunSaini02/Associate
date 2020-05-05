//
//  Chapter.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit

// Supercategory containing pages (events)
class Chapter {
    var pages: [Page]
    var identifier: String

    init(pages: [Page], identifier: String) {
        self.pages = pages
        self.identifier = identifier
    }
}
