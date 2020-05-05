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
        VStack{
            Text("DetailView")
            
            }
        }.navigationBarTitle("Feed My Starving Children")
    }
}

struct OppsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OppsDetailView(opps: testData)
    }
}
