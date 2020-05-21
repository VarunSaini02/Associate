//
//  OpportunitiesDetailView.swift
//  Associate
//
//  Created by 90302939 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct OppsDetailView: View {
    
    var opps: [OppsData] = testData
    
    var body: some View {
        NavigationView{
            VStack {
                Image("fmsc")
                    .resizable()
                    .scaledToFit()
                    .padding()
                HStack {
                    Text("Eden Prairie, MN")
                        .padding(.leading, 15)
                    Text("12 spots left")
                }
            }
            .navigationBarTitle("Info")
        }
    }
}

struct OppsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OppsDetailView(opps: testData)
    }
}
