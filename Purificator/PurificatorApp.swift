//
//  PurificatorApp.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/14/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseDatabaseSwift

@main
struct PurificatorApp: App {
    init() {
            FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true

        }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthenticationModel())
        }
    }
}
