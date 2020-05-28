//
//  Profile.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class Profile: ObservableObject {
    @Published var name: Name
    @Published var email: String
    @Published var book: Book
    @Published var profilePic: Image = Image("defaultPFP")
    
    var anyCancellable: AnyCancellable? = nil
    
    init(firstName: String, lastName: String, email: String, book: Book) {
        self.name = Name(firstName, lastName)
        self.email = email
        self.book = book
        
        setUpAnyCancellable()
    }
    
    // Default static values
    init() {
        self.name = Name("Bela","Konkoly")
        self.email = "iOSIsAwesome@gmail.com"
        
        let identifier = "Teaching Kids How to Swim"
        let description = "I helped kids from the age of 5–10 years old learn how to swim through a program that the American Red Cross facilitated."
        let startDate = Date()
        let endDate = startDate.addingTimeInterval(7200)
        let verify = Verification(types: [.contact], contacts: [Contact(name: Name("Varun","Saini"), email: "BlakeBranvold@gmail.com", phone: PhoneNumber(123, 456, 7890))])
        
        let identifier2 = "Eating."
        let description2 = "I ate some pizza!"
        
        let pages = [Page(identifier: identifier, description: description, startDate: startDate, endDate: endDate, verification: verify)]
        let pages2 = [Page(identifier: identifier2, description: description2, startDate: startDate, endDate: endDate, verification: verify)]
        
        self.book = Book(chapters: [Chapter(pages: pages, identifier: "Community Service"), Chapter(pages: pages2, identifier: "Food Chapter")])
        
        setUpAnyCancellable()
    }
    
    func cpIndexOf(page: Page) -> CPIndex {
        for ch in 0 ..< book.chapters.count {
            for pg in 0 ..< book.chapters[ch].pages.count {
                if page === book.chapters[ch].pages[pg] {
                    return CPIndex(ch: ch, pg: pg)
                }
            }
        }
        return CPIndex(ch: -1, pg: -1)
    }
    
    private func setUpAnyCancellable() {
        anyCancellable = self.book.objectWillChange.sink(receiveValue: { (_) in
            self.objectWillChange.send()
        })
    }
}
