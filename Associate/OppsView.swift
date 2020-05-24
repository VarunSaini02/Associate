//
//  OpportunitiesView.swift
//  Associate
//
//  Created by 90302939 on 4/28/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct OppsView: View {
    
    var opps: [OppsData] = testData
    @State var eventType = true
    
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $eventType) {
                    Text("Show Opportunities in My Area")
                }
                .padding()
                
                if eventType {
                    List(opps) { item in
                        NavigationLink(destination: OppsDetailView(opps: self.opps)) {
                            Group {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                    HStack(alignment: .top) {
                                        Text(item.location)
                                            .font(.subheadline)
                                        Spacer()
                                        Text("12")
                                            .font(.subheadline)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    // Placeholder Spacer() until something is put here
                    Spacer()
                }
            }.navigationBarTitle(Text("Opportunities"))
                .navigationBarItems(trailing: NavigationLink(destination: SortView()) {
                    Text("Sort")
                })
        }
    }
}

struct OppsView_Previews: PreviewProvider {
    static var previews: some View {
        OppsView(opps: testData)
    }
}

