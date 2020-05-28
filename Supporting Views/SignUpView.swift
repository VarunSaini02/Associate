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
    
    @State private var proceedToNextScreen = false
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .invalidFields
    
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
        
        return ZStack {
            NavigationLink(destination: WelcomeNewUser(authenticating: $authenticating, firstName: firstName, lastName: lastName, email: email, password: password), isActive: $proceedToNextScreen) {
                Text("Go to chapter and page creation.")
            }
            .hidden()
            
            VStack {
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
                }) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 150, height: 60)
                            .clipShape(Capsule())
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top)
            }
        }
        .navigationBarTitle(Text("Sign Up"), displayMode: .inline)
        .alert(isPresented: $showAlert) {
            switch self.activeAlert {
            case .repeatEmail:
                return Alert(title: Text("Email already in use."), dismissButton: .default(Text("Okay")))
            case .unmatchedPasswords:
                return Alert(title: Text("Passwords do not match."), dismissButton: .default(Text("Okay")))
            case .invalidFields:
                return Alert(title: Text("Please enter all fields."), dismissButton: .default(Text("Okay")))
            }
        }
    }
    
    func authenticateInformation() {
        guard UserDefaults.standard.string(forKey: email) == nil else {
            activeAlert = .repeatEmail
            showAlert = true
            return
        }
        
        guard passwordMsg == "Passwords match!" else {
            activeAlert = .unmatchedPasswords
            showAlert = true
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
            activeAlert = .invalidFields
            showAlert = true
            return
        }
        
        authenticateInformation()
    }
    
    enum ActiveAlert {
        case repeatEmail
        case unmatchedPasswords
        case invalidFields
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authenticating: Binding.constant(true))
    }
}
