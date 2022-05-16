//
//  PurificatorApp.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/14/22.
//

import SwiftUI
import Firebase

@main
struct PurificatorApp: App {
    init() {

            FirebaseApp.configure()
            Auth.auth().signInAnonymously { authResult, error in
                guard let user = authResult?.user else {
                    print("FAILED: Anonymously auth ")
                    return
                }
                let uId = user.uid
                print("Firebase user Id : \(uId)")
            }
        }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
