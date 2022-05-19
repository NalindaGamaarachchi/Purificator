//
//  ContentView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/14/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var authModel: AuthenticationModel 
     
    var body: some View {
        Group {
          if authModel.user == nil {
            LoginView()
          } else {
            TabBarView()
          }
        }
        .onAppear {
          authModel.listenToAuthState()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationModel())
            .environmentObject(DataViewModel())
    }
}
