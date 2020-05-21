//
//  ProfileView.swift
//  Associate
//
//  Created by 90302939 on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profile = Profile()
    @State private var whichChapter = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Image("profilePic")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(45)
                    .padding(.bottom)
                Text(profile.name.fullName)
                
                NavigationLink(destination: ProfileDetailView(profile: profile)){
                    Text("Edit Profile")
                }.padding()
                
                Picker(selection: $whichChapter, label: Text("Choose a Chapter:")) {
                ForEach(0 ..< profile.book.chapters.count) {
                    Text(self.profile.book.chapters[$0].identifier)
                }
                }.pickerStyle(WheelPickerStyle()).labelsHidden()
                
                List(profile.book.chapters[whichChapter].pages) { page in
                    NavigationLink(destination: PastEventsView(page: page)) {
                        Text(page.identifier)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

