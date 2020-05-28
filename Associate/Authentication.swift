//
//  LogInOrSignUp.swift
//  Associate
//
//  Created by 90304566 on 5/25/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct Authentication: View {
    @Binding var authenticating: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.offGray[0], .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 60) {
                Text("Welcome to the Library.")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 60))
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: LoginView(authenticating: $authenticating)){
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[0]]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 150, height: 60)
                            .clipShape(Capsule())
                        Text("Log In")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
                
                NavigationLink(destination: SignUpView(authenticating: $authenticating)) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[0]]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 150, height: 60)
                            .clipShape(Capsule())
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct LogInOrSignUp_Previews: PreviewProvider {
    static var previews: some View {
        Authentication(authenticating: Binding.constant(true))
    }
}
