//
//  login.swift
//  Associate
//
//  Created by 90302939 on 5/5/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Enter Username")
                Text("Enter Password")
                NavigationLink(destination:
                ContentView()){
                    Text("Login")
                }
            }
            
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
