//
//  UploadView.swift
//  Associate
//
//  Created by 90302939 on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct UploadView: View {
    
    @EnvironmentObject var profile: Profile
    @State private var showingChapterSheet = false
    @State private var newChapterName = ""
    
    var body: some View {
        VStack {
            Text("EDEN PRAIRIE HIGH SCHOOL")
            Image("epInside")
                .resizable()
                .scaledToFit()
                .cornerRadius(45)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: UploadDetailView()) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .leading, endPoint: .trailing)
                        .frame(width: 180, height: 80)
                        .clipShape(Capsule())
                    Text("Upload New Page")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }.padding()
            
            Button(action: {
                self.showingChapterSheet.toggle()
            }) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .leading, endPoint: .trailing)
                        .frame(width: 180, height: 80)
                        .clipShape(Capsule())
                    Text("Create New Chapter")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarTitle("Upload", displayMode: .inline)
        .sheet(isPresented: $showingChapterSheet) {
            VStack(spacing: 20) {
                TextField("Enter new chapter name", text: self.$newChapterName)
                    .font(.system(size: 24))
                    .foregroundColor(Color(red: 80/255, green: 80/255, blue: 80/255))
                    .centerInForm()
                
                Button(action: {
                    if self.newChapterName != "" {
                        self.profile.book.addChapter(chapter: Chapter(pages: [], identifier: self.newChapterName))
                    }
                    
                    self.showingChapterSheet.toggle()
                }) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.offGray[0], Color.offGray[11]]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 150, height: 60)
                            .clipShape(Capsule())
                        Text("Save")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding(.all, 40)
            .addLightGrayGradientBackground()
        }
        
        
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}

