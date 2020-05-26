//
//  ImageUploadView.swift
//  Associate
//
//  Created by 90302939 on 5/25/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct UploadImageView: View {
    
    @State private var image: Image?
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                Spacer()
                
                Button("Save") {
                    //save the picture
                }
                
            }
        }
        .padding([.horizontal, .bottom])
        .navigationBarTitle("Add a Picture")
        .sheet(isPresented: $showingImagePicker,
               onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
        }
        
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageView()
    }
}
