//
//  ProfileDetailView.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ProfileDetailView: View {
    
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        VStack{
            Image(uiImage: #imageLiteral(resourceName: "profilePic")) //insert picture user selects
                .resizable()
                .scaledToFit()
                .cornerRadius(60)
                .padding()
            
            Text(profile.name.fullName)
            Text("Profile Functions")
            
            ForEach(0 ..< 5) { _ in
                Text(self.profile.email) //proof of concept that email can be displayed
                    .multilineTextAlignment(.center)
            }
            
        }
        .navigationBarTitle("Edit Profile")
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
