//
//  Profile.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//
//

import UIKit

class Profile {
    var name: Name
    var email: String
    var book: Book

    init(firstName: String, lastName: String, email: String, book: Book) {
        self.name = Name(firstName, lastName)
        self.email = email
        self.book = book
    }
    
    //just for Tuesday, May 19
    init() {
        self.name = Name("Bela","Konkoly")
        self.email = "iOSIsAwesome@gmail.com"
        
        let identifier = "Teaching Kids How to Swim"
        let description = "I helped kids from the age of 5–10 years old learn how to swim through a program that the American Red Cross facilitated."
        let startDate = Date()
        let endDate = startDate.addingTimeInterval(7200)
        let verify = Verification(types: [.contact], contacts: [Contact(name: Name("Varun","Saini"), email: "BlakeBranvold@gmail.com", phone: PhoneNumber(123, 456, 7890))])
        
        let pages = [Page(identifier: identifier, description: description, startDate: startDate, endDate: endDate, verification: verify)]
        
        self.book = Book(chapters: [Chapter(pages: pages, identifier: "Community Service")])
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
