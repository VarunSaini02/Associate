//
//  ContentView.swift
//  Associate
//
//  Created by Varun Saini, Bela Konkoly, and Blake Branvold on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var profile: Profile 
    
    var body: some View {
        TabView {
            OppsView()
                .tabItem {
                    VStack {
                        Image(systemName: "globe")
                        Text("Opportunities")
                    }
            }
            .tag(1)
            
            UploadView()
                .tabItem {
                    VStack {
                        Image(systemName: "arrow.up.square.fill")
                        Text("Upload")
                    }
            }
            .tag(0)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .tag(2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

