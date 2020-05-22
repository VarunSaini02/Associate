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
    
    var body: some View {
        VStack {
            Text(page.description ?? "No description provided!")
                .padding()
            
            Button(action: {
                self.page.description? += "a"
            }) {
                // This can't modify the title of the NavigationLink that brought the user to this View, otherwise it sends the user back to the ProfileView. That is why this button has been changed to modify the description, rather than the identifier, which is used as the NavigationLink title.
                Text("Click to add an 'a' to description")
            }
        }
        .navigationBarTitle(page.identifier)
    }
}

struct PastEventsView_Previews: PreviewProvider {
    static var previews: some View {
        PastEventsView(page: Profile().book.chapters[0].pages[0])
    }
}
