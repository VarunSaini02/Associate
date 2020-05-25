//
//  SortView.swift
//  Associate
//
//  Created by 90302939 on 5/10/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import SwiftUI

struct SortView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var oppsList: OpportunityList
    
    @State var stateOppsArray: [Opportunity] = [Opportunity]()
    
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Sort Alphabetically (Name)") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.name.lowercased() < $1.name.lowercased()
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort by Shortest to Longest Name") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.name.count < $1.name.count
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort by Longest to Shortest Name") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.name.count > $1.name.count
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort Alphabetically (Location)") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.location.lowercased() < $1.location.lowercased()
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort Alphabetically (Description)") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.description.lowercased() < $1.description.lowercased()
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort by Shortest to Longest Description") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.description.count < $1.description.count
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort by Longest to Shortest Description") {
                self.stateOppsArray = self.stateOppsArray.sorted {
                    $0.description.count > $1.description.count
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Button("Sort Randomly") {
                self.stateOppsArray = self.stateOppsArray.shuffled()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle("Refine Search")
        .onAppear() {
            self.stateOppsArray = self.oppsList.opps
        }
        .onDisappear() {
            self.oppsList.opps = self.stateOppsArray
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView(oppsList: testOpportunityList)
    }
}
