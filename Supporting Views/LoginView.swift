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
    
    @State private var email = ""
    @State private var password = ""
    @Binding var authenticating: Bool
    @State private var isShowingInvalid = false
    
    var body: some View {
        let emailLowercased = Binding<String>(get: {
            self.email
        }, set: {
            self.email = $0.lowercased()
        })
        
        return VStack(spacing: 60) {
            TextField("Enter email", text: emailLowercased)
                .padding(.horizontal, 40)
            
            SecureField("Enter password", text: $password)
                .padding(.horizontal, 40)
            
            Button(action: {
                self.authenticateLogin()
            }) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .leading, endPoint: .trailing)
                        .frame(width: 150, height: 60)
                        .clipShape(Capsule())
                    Text("Log In")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarTitle("Log In", displayMode: .inline)
        .alert(isPresented: $isShowingInvalid) {
            Alert(title: Text("Invalid email or password"), message: nil, dismissButton: .default(Text("Okay")))
        }
    }
    
    func authenticateLogin() {
        guard let realPassword = UserDefaults.standard.string(forKey: email) else {
            isShowingInvalid = true
            return
        }
        
        if realPassword != password {
            isShowingInvalid = true
            return
        }

        withAnimation {
            self.authenticating.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticating: Binding.constant(true))
    }
}
