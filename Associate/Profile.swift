//
//  Profile.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI

class Profile {
    var name: Name
    var email: String
    var book: Book

    init(firstName: String, lastName: String, email: String, book: Book) {
        self.name = Name(firstName, lastName)
        self.email = email
        self.book = book
    }
}

struct Name {
    var firstName: String
    var lastName: String
    var fullName: String
    
    init(_ firstName: String, _ lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = firstName + " " + lastName
    }
}
