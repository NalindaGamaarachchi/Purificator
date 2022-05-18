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

        VStack {
            Text("Today's Data")

            HStack {
                VStack {
                    Text(data.phvalue)
                    Text("Ph Value")
                }
                VStack {
                    Text(data.tempvalue)
                    Text("temp Value")
                }
                VStack {
                    Text(data.wFlowvalue)
                    Text("wflow Value")
                }


            }


            Text("today chamical")
            HStack {
                VStack {
                    Text("chlorine")
                    Text("chlorine value")
                }
                VStack {
                    Text("asid")
                    Text("asid value")
                }
                VStack {
                    Text("bhasma")
                    Text("bhasma value")
                }
            }


            Text("mortor time")
            //progress bar
        }
        .onAppear{
            data.readData()
        }
    }
    

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
