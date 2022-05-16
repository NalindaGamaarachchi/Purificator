//
//  HomeView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/15/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var data: DataModel = DataModel()
    
    var body: some View {
        HStack {
            Text("Today's Data")
            
            VStack {
                HStack {
                    Text(data.phvalue)
                    Text("Ph Value")
                }
                HStack {
                    Text(data.tempvalue)
                    Text("temp Value")
                }
                HStack {
                    Text(data.wFlowvalue)
                    Text("wflow Value")
                }
                
                
            }
            
            
            Text("today chamical")
            VStack {
                HStack {
                    Text("chlorine")
                    Text("chlorine value")
                }
                HStack {
                    Text("asid")
                    Text("asid value")
                }
                HStack {
                    Text("bhasma")
                    Text("bhasma value")
                }
            }
        
            
            Text("mortor time")
            //progress bar
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
