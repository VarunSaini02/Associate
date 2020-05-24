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
            Image("profilePic") //insert picture user selects
                .resizable()
                .scaledToFit()
                .cornerRadius(60)
                .padding(40)
            
                    Section(header: Text("Personal information").fontWeight(.light)) {
                HStack {
                    Text("Full Name:")
                        .fontWeight(.bold)
                    Text(profile.name.fullName)
                }
                HStack {
                    Text("Email:")
                        .fontWeight(.bold)
                    Text(profile.email)
                }
            }
            .padding(.bottom, 20)
        }
        .navigationBarTitle(Text("Edit Profile"), displayMode: .inline)
    }
}


struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
