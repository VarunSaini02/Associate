//
//  Verification.swift
//  Associate
//
//  Created by 90304566 on 5/7/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI

class Verification: ObservableObject {
    enum VerificationType {
        case contact // contact information (name, email, phone, etc.) for someone who can verify (last resort)
        case images // pictures of volunteer slips, signatures, or other forms of proof
        case direct // organizer verifies through their own account (most reliable)
    }
    
    @Published var types = [VerificationType]()
    @Published var images: [Image]?
    @Published var contacts: [Contact]?
    
    init (types: [VerificationType], images: [Image]? = nil, contacts: [Contact]? = nil) {
        self.contacts = contacts
        self.images = images
        
        for type in types where !self.types.contains(type) {
            self.types.append(type)
        }
    }
    
    func removeType(typesToRemove: [VerificationType]) {
        var toDisable = [VerificationType]()
        //self.types.removeAll { typesToRemove.contains($0) }
        
        self.types.removeAll {
            if typesToRemove.contains($0) {
                toDisable.append($0)
                return true
            } else { return false }
        }
        
        
    }
    
    func nullifyStaleProperties(types: [VerificationType]) {
        for type in types {
            switch type {
            case .contact:
                self.contacts = nil
            case .images:
                self.images = nil
            case .direct:
                break
            }
        }
    }
    
    
}

struct Contact {
    var name: Name?
    var email: String?
    var phone: PhoneNumber?
    
    init(name: Name? = nil, email: String? = nil, phone: PhoneNumber? = nil) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}

struct PhoneNumber {
    var areaCode: Int
    var prefix: Int
    var lineNumber: Int
    var unformatted: Int
    
    init(_ areaCode: Int, _ prefix: Int, _ lineNumber: Int) {
        self.areaCode = areaCode
        self.prefix = prefix
        self.lineNumber = lineNumber
        
        unformatted = (areaCode * 10000000) + (prefix * 10000) + lineNumber
    }
}
