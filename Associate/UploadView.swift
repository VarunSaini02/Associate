//
//  UploadView.swift
//  Associate
//
//  Created by 90302939 on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct UploadView: View {
    var body: some View {
        VStack {
            Text("EDEN PRAIRIE HIGH SCHOOL")
            Image("epInside")
                .resizable()
                .scaledToFit()
                .cornerRadius(45)
            
            NavigationLink(destination: UploadDetailView()) {
                Text("Upload New Page")
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.title)
            }.padding()
        }
        .navigationBarTitle("Upload", displayMode: .inline)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}

