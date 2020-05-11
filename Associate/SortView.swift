//
//  SortView.swift
//  Associate
//
//  Created by 90302939 on 5/10/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct SortView: View {
    var body: some View {
        NavigationView{
            List(0 ..< 5) { item in
            Text("Sort By")
                   
               }
        }
    .navigationBarTitle("Refine Search")
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
