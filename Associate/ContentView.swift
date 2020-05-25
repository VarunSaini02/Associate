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
    
    @State private var authenticating: Bool = true
    
    var body: some View {
        ZStack {
            if authenticating {
                NavigationView {
                    Authentication(authenticating: $authenticating)
                }
            } else {
                MainTabView()
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

