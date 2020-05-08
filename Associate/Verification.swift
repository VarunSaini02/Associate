//
//  Verification.swift
//  Associate
//
//  Created by 90304566 on 5/7/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI

class Verification {
    enum VerifyType {
        case direct
        case images
    }
    
    var types = [VerifyType]()
    var images: [Image]?
    
    init (images: [Image]? = nil, types: [VerifyType]) {
        self.images = images
        
        for type in types where !self.types.contains(type) {
            self.types.append(type)
        }
    }
    
    func removeType(typesToRemove: [VerifyType]) {
        self.types.removeAll { typesToRemove.contains($0) }
        
        /*
        //expanded closure
        self.types.removeAll(where: { (type) -> Bool in
            return typesToRemove.contains(type)
        })
        */
    }
}
