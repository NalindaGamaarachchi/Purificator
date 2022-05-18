//
//  TabBarView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/18/22.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            DailyDataView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(Color("Primary"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
