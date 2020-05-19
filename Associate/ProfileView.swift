//
//  ProfileView.swift
//  Associate
//
//  Created by 90302939 on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    let profile = Profile()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("profilePic")
                    .resizable()
                    .scaledToFit()
                .cornerRadius(45)
                    .padding()
                Text(profile.name.fullName)
                
                //problem child
                List(profile.book.chapters[0].pages) { item in
                    NavigationLink(destination: PastEventsView().navigationBarTitle("Past Event")){
                        Text("hello varun")
                    }
                }
                NavigationLink(destination: ProfileDetailView().navigationBarTitle("Edit Profile")){
                    Text("Edit Profile")
                }.padding()
            }
            
        }
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

