//
//  ProfileDetailView.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ProfileDetailView: View {
    var body: some View {
        VStack{
            Image("profilePic") //insert picture user selects
                .resizable()
                .scaledToFit()
                .cornerRadius(60)
                .padding()
            
            Text("Bela Konkoly") //insert name of user
            Text("Profile Functions")
            List(0 ..< 5) { item in
                Text("Edit Profile")
                       
                   }
               }
                }
            }
                
            
        
    


struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
