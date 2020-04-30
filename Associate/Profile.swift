//
//  Profile.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit

class Profile {
    var name: Name
    var email: String
    var book: Book
    
    init(firstName: String, lastName: String, email: String, book: Book) {
        self.name = Name(firstName: firstName, lastName: lastName)
        self.email = email
        self.book = book
    }
}

struct Name {
    var firstName: String
    var lastName: String
}
