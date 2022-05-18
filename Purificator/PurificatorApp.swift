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
//            Auth.auth().signInAnonymously { authResult, error in
//                guard let user = authResult?.user else {
//                    print("FAILED: Anonymously auth ")
//                    return
//                }
//                let uId = user.uid
//                print("Firebase user Id : \(uId)")
//            }
        }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthenticationModel())
        }
    }
}
