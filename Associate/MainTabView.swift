//
//  MainTabView.swift
//  Associate
//
//  Created by 90304566 on 5/25/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 1
    
    private let navTitles = ["Opportunities", "Upload", "Profile"]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                OppsView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "globe")
                    Text("Opportunities")
                }
            }
            .tag(0)
            
            NavigationView {
                UploadView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "arrow.up.square.fill")
                    Text("Upload")
                }
            }
            .tag(1)
            
            NavigationView {
                ProfileView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
            .tag(2)
        }
        .navigationBarTitle(Text(navTitles[selectedTab]), displayMode: .inline)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
