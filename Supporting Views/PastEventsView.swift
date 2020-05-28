//
//  PastEventsView.swift
//  Associate
//
//  Created by 90302939 on 5/19/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct PastEventsView: View {
    
    @EnvironmentObject var profile: Profile
    var page: Page
    
    @State private var identifier: String = ""
    
    private var CP: CPIndex {
        self.profile.cpIndexOf(page: self.page)
    }
    
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Chapter").font(.system(size: 36))
                Text("\(self.profile.book.chapters[CP.ch].identifier)")
                
                Text("Description").font(.system(size: 36)).padding(.top, 30)
                Text(page.description != "" ? page.description : "No description provided!")
                
                Text("Time").font(.system(size: 36)).padding(.top, 30)
                Text(page.time?.startDate != nil ? formatter.string(from: page.time!.startDate!) : "No start date provided!")
                Text("to")
                Text(page.time?.endDate != nil ? formatter.string(from: page.time!.endDate!) : "No end date provided!")
            }
            .font(.system(size: 24))
            .padding(.top, 10)
            .padding(.horizontal, 40)
            .foregroundColor(Color(red: 80/255, green: 80/255, blue: 80/255))
        }
        .onAppear() {
            print("appear")
            self.identifier = self.page.identifier
        }
        .onDisappear {
            print("disappear")
            self.page.identifier = self.identifier
        }
        .navigationBarTitle(Text(identifier), displayMode: .inline)
    }
}

struct PastEventsView_Previews: PreviewProvider {
    static var previews: some View {
        PastEventsView(page: Profile().book.chapters[0].pages[0])
    }
}
