//
//  ContentView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/14/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var data: DataModel = DataModel()
     
    var body: some View {
        Button {
            data.readData()
        } label: {
            Text("Read data")
        }
        .onAppear {
            data.readData()
            print("View did appear")
        }
        
        Text(data.phvalue)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
