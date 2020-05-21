//
//  Chapter.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI

// Supercategory containing pages (events)

class Chapter: ObservableObject {
    @Published var pages: [Page]
    @Published var identifier: String
    
    init(pages: [Page], identifier: String) {
        self.pages = pages
        self.identifier = identifier
    }
}
