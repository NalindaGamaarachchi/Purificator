//
//  DataModel.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/15/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseDatabaseSwift
import CoreData

class DataModel: ObservableObject {
    
    let phData = Database.database().reference().child("data/ph")
    let tempData = Database.database().reference().child("data/temp")
    let wFlowData = Database.database().reference().child("data/wFlow")
    
    @Published var phvalue: String = ""
    @Published var tempvalue: String = ""
    @Published var wFlowvalue: String = ""
    
    func readData() {
        phData.observe(DataEventType.value, with: { snapshot in
            snapshot.value.map({ ph in
                self.phvalue = ph as! String
                print(ph)
            })
          })
        tempData.observe(DataEventType.value, with: { snapshot in
            snapshot.value.map({ temp in
                self.tempvalue = temp as! String
                print(temp)
            })
          })
        wFlowData.observe(DataEventType.value, with: { snapshot in
            snapshot.value.map({ wFlow in
                self.wFlowvalue = wFlow as! String
                print(wFlow)
            })
          })
    }
    
    func calculateChlorine() {
        
    }
}
