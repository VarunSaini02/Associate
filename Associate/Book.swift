//
//  Book.swift
//  Associate
//
//  Created by 90304566 on 5/4/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class Book: ObservableObject, Identifiable {
    @Published var chapters: [Chapter]
    
    let id = UUID()
    
    var anyCancellable: [Int: AnyCancellable?] = [:]
    
    init(chapters: [Chapter]) {
        self.chapters = chapters
        
        setUpAnyCancellable()
    }
    
    func addChapter(chapter: Chapter) {
        chapters.append(chapter)
        sortChaptersAlphabetically()
        setUpAnyCancellable()
    }
    
    func removeChapter(chapter: Chapter) {
        self.chapters.removeAll { $0.id == chapter.id }
        setUpAnyCancellable()
    }
    
    func sortChaptersAlphabetically() {
        chapters.sort { $0.identifier.lowercased() < $1.identifier.lowercased() }
    }
    
    private func setUpAnyCancellable() {
        for ch in 0 ..< chapters.count {
            anyCancellable[ch] = self.chapters[ch].objectWillChange.sink(receiveValue: { (_) in
                self.objectWillChange.send()
            })
        }
    }
}
