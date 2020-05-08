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
    enum VerificationType {
        case direct // organizer verifies through their own account (most reliable)
        case images // pictures of volunteer slips, signatures, or other forms of proof
        case contact // contact information (name, email, phone, etc.) for someone who can verify (last resort)
    }

    var types = [VerificationType]()
    var images: [Image]?
    
    init (images: [Image]? = nil, types: [VerificationType]) {
        self.images = images
        
        for type in types where !self.types.contains(type) {
            self.types.append(type)
        }
    }
    
    func removeType(typesToRemove: [VerificationType]) {
        self.types.removeAll { typesToRemove.contains($0) }
    }
}
