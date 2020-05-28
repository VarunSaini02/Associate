//
//  LoginView.swift
//  Associate
//
//  Created by 90304566 on 5/25/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var profile: Profile
    
    @State private var username = ""
    @State private var password = ""
    @Binding var authenticating: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .top, endPoint: .bottom)
                
        VStack(spacing: 60) {
            TextField("Enter username", text: $username)
                .padding(.horizontal, 40)
            
            SecureField("Enter password", text: $password)
                .padding(.horizontal, 40)
            
            Button(action: {
                withAnimation {
                    self.authenticating.toggle()
                }
            }) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .leading, endPoint: .trailing)
                        .frame(width: 150, height: 60)
                        .clipShape(Capsule())
                    Text("Log In")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
        }
    }
        .navigationBarTitle("Log In", displayMode: .inline)
        .background(Color.offGray[0])
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticating: Binding.constant(true))
    }
}
