//
//  WelcomeNewUser.swift
//  Associate
//
//  Created by 90304566 on 5/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct WelcomeNewUser: View {
    @EnvironmentObject var profile: Profile
    
    @Binding var authenticating: Bool
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    @State private var chIdentifier = ""
    @State private var pgIdentifier = ""
    @State private var pgDescription = ""
    
    @State private var invalidFields = false
    
    var body: some View {
        VStack {
            Text("To finish creating your profile, let's set up your first chapter and page in your new book.")
                .foregroundColor(Color.offGray[0])
            
            Form {
                Section(header: Text("Chapter"), footer: Text("A chapter is an organizer. It stores different types of pages, which contain more detailed information about events. Name your first chapter something like \"NHS\", \"Key Club\", or even \"Presidential Volunteer Service Award\".")) {
                    TextField("Name your first chapter", text: $chIdentifier)
                }
                
                Section(header: Text("Page"), footer: Text("A page is essentially an event. Use this area to fill out the details of your page. It can be anything: Feed My Starving Children, a school carnival, tutoring, etc. For now, let's keep it simple and just add a name and description.")) {
                    TextField("Name your first page", text: $pgIdentifier)
                    
                    TextField("Enter a short description", text: $pgDescription)
                }
                
                // Save button
                Button(action: {
                    self.validate()
                    if !self.invalidFields {
                        self.makeProfile()
                        self.saveAccountInfo()
                    }
                }) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 150, height: 60)
                            .clipShape(Capsule())
                        Text("Proceed")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical, 10)
                .centerInForm()
            }
            .navigationBarTitle("Welcome \(firstName)!", displayMode: .inline)
            .alert(isPresented: $invalidFields) {
                Alert(title: Text("Not all fields have been entered."), dismissButton: .default(Text("Okay")))
            }
        }
        .padding(.top, 10)
    }
    
    func validate() {
        if chIdentifier == "" || pgIdentifier == "" || pgDescription == "" {
            invalidFields = true
        } else {
            invalidFields = false
        }
    }
    
    func makeProfile() {
        let newPage = Page(identifier: self.pgIdentifier, description: self.pgDescription, startDate: nil, endDate: nil, images: nil, verification: nil)
        let newChapter = Chapter(pages: [newPage], identifier: self.chIdentifier)
        let newBook = Book(chapters: [newChapter])
        self.profile.name = Name(self.firstName, self.lastName)
        self.profile.email = self.email
        self.profile.book = newBook
    }
    
    func saveAccountInfo() {
        UserDefaults.standard.set(password, forKey: self.email)
        
        //code profile into UserDefaults too
        
        withAnimation {
            self.authenticating.toggle()
        }
    }
}


struct WelcomeNewUser_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeNewUser(authenticating: Binding.constant(true), firstName: "John", lastName: "Doe", email: "Johnny@gmail.com", password: "doughboy123")
    }
}
