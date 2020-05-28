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
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordCheck = ""
    @State private var passwordMsg = ""
    
    @State private var repeatedEmail = false
    @State private var passwordsUnmatching = false
    @State private var proceedToNextScreen = false
    @State private var invalidFields = false
    
    var body: some View {
        let emailLowercased = Binding<String>(get: {
            self.email
        }, set: {
            self.email = $0.lowercased()
        })
        
        let passwordChecker1 = Binding<String>(get: {
            self.password
        }, set: {
            self.password = $0
            self.updatePasswordFooter()
        })
        
        let passwordChecker2 = Binding<String>(get: {
            self.passwordCheck
        }, set: {
            self.passwordCheck = $0
            self.updatePasswordFooter()
        })
        
        return VStack {
           Form {
                Section(header: Text("Name")) {
                    TextField("Enter first name", text: $firstName)
                    TextField("Enter last name", text: $lastName)
                }
                
                Section(header: Text("Email")) {
                    TextField("Enter email", text: emailLowercased)
                    
                }
                
                Section(header: Text("Password"), footer: Text(passwordMsg)) {
                    SecureField("Create a password", text: passwordChecker1)
                    SecureField("Re-enter password", text: passwordChecker2)
                }
            }
            
            Button(action: {
                self.validate()
                self.authenticateInformation()
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
            
            NavigationLink(destination: WelcomeNewUser(authenticating: $authenticating, firstName: firstName, lastName: lastName, email: email, password: password), isActive: $proceedToNextScreen) {
                Text("Go to chapter and page creation.")
            }
            .hidden()
        }
        .navigationBarTitle(Text("Sign Up"), displayMode: .inline)
        .alert(isPresented: $repeatedEmail) {
            Alert(title: Text("Email already in use"), message: nil, dismissButton: .default(Text("Okay")))
        }
        .alert(isPresented: $passwordsUnmatching) {
            Alert(title: Text("Passwords do not match"), message: nil, dismissButton: .default(Text("Okay")))
        }
        .alert(isPresented: $invalidFields) {
            Alert(title: Text("Not all fields have been entered"), dismissButton: .default(Text("Okay")))
        }
    }
    
    func authenticateInformation() {
        guard UserDefaults.standard.string(forKey: email) == nil else {
            repeatedEmail = true
            return
        }
        
        guard passwordMsg == "Passwords match!" else {
            passwordsUnmatching = true
            return
        }
        
        proceedToNextScreen.toggle()
    }
    
    func updatePasswordFooter() {
        if passwordCheck == "" && password == "" {
            passwordMsg = ""
        } else if passwordCheck == password {
            passwordMsg = "Passwords match!"
        } else {
            passwordMsg = "Passwords do not match!"
        }
    }
    
    func validate() {
        if firstName == "" || lastName == "" || email == "" || password == "" || passwordCheck == "" {
            invalidFields = true
        } else {
            invalidFields = false
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authenticating: Binding.constant(true))
    }
}
