//
//  SignUpView.swift
//  Associate
//
//  Created by 90304566 on 5/25/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var profile: Profile
    
    @Binding var authenticating: Bool
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var blankBook: Bool = false
    
    var body: some View {
        VStack {
            Text("THIS PAGE IS VERY BUGGY RIGHT NOW") // To be removed
            
            Form {
                Section(header: Text("Name")) {
                    HStack {
                        TextField("Enter first name", text: $firstName)
                        TextField("Enter last name", text: $lastName)
                    }
                }
                
                Section(header: Text("Email")) {
                    TextField("Enter email", text: $email)
                    
                }
                
                Section(header: Text("Book")) {
                    Toggle(isOn: $blankBook) { Text("Start with a fresh book? As of now, doing this will cause crazy errors.")
                    }
                }
            }
            
            Button(action: {
                withAnimation {
                    self.authenticating.toggle()
                    
                    self.profile.name = Name(self.firstName, self.lastName)
                    self.profile.email = self.email
                    
                    if self.blankBook {
                        self.profile.book = Book(chapters: [Chapter]())
                    }
                }
            }) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .leading, endPoint: .trailing)
                        .frame(width: 150, height: 60)
                        .clipShape(Capsule())
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarTitle(Text("Sign Up"), displayMode: .inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authenticating: Binding.constant(true))
    }
}
