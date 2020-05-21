//
//  ContentView.swift
//  Associate
//
//  Created by Varun Saini, Bela Konkoly, and Blake Branvold on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            OppsView()
                .tabItem {
                    VStack {
                        Image(systemName: "crc")//get noun project from nelson
                        Text("Oppurtunities")
                    }
            }
            .tag(1)
            
            UploadView()
                .tabItem {
                    VStack {
                        Image(systemName: "home")//get noun project from nelson
                        Text("Uploads")
                    }
            }
            .tag(0)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")//get noun project from nelson
                        Text("Profiles")
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

