//
//  PastEventsView.swift
//  Associate
//
//  Created by 90302939 on 5/19/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct PastEventsView: View {
    
    @EnvironmentObject var profile: Profile
    var page: Page
    
    @State private var identifier: String = ""
    
    var body: some View {
        VStack {
            Text(page.description != "" ? page.description : "No description provided!")
                .padding()
            Button(action: {
                self.identifier += "a"
            }) {
                Text("Click to add an 'a' to page identifier")
            }
            
            Button(action: {
                self.page.description += "a"
            }) {
                Text("Click to add an 'a' to page description")
            }
            
            Button(action: {
                let CP = self.profile.cpIndexOf(page: self.page)
                self.profile.book.chapters[CP.ch].identifier += "a"
            }) {
                Text("Click to add an 'a' to chapter identifier")
            }
        }
        .onAppear() {
            print("appear")
            self.identifier = self.page.identifier
        }
        .onDisappear {
            print("disappear")
            self.page.identifier = self.identifier
        }
        .navigationBarTitle(identifier)
    }
}

struct PastEventsView_Previews: PreviewProvider {
    static var previews: some View {
        PastEventsView(page: Profile().book.chapters[0].pages[0])
    }
}
