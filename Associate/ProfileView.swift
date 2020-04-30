//
//  ProfileView.swift
//  Associate
//
//  Created by 90302939 on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello User")
                NavigationLink(destination: ProfileDetailView().navigationBarTitle("Edit Profile")){
                    Text("Edit Profile")
                }
                
            }
            
                
            
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
}
