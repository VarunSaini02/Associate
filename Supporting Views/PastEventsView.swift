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
    @ObservedObject var page: Page
    
    var body: some View {
        NavigationView {
            VStack {
                Text(page.description ?? "No description provided!")
                    .padding()
                
                Button(action: {
                    self.page.identifier += "a"
                    
                    //this proves that the profile is also changing in the environment
                    print(self.profile.book.chapters[1].pages[0].identifier)
                }) {
                    //proof of concept
                    Text("Click to add an 'a' to identifier")
                }
            }
            .navigationBarTitle(page.identifier)
        }
    }
}

struct PastEventsView_Previews: PreviewProvider {
    static var previews: some View {
        PastEventsView(page: Profile().book.chapters[0].pages[0])
    }
}
