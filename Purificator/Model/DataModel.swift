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
    let fTimeData = Database.database().reference().child("data/fTime")
    
    @Published var phvalue: String = ""
    @Published var tempvalue: String = ""
    @Published var wFlowvalue: String = ""
    
    @Published var filterTime: Float = 360 // 6h = 60min * 6
    @Published var finishFilteTime: String = "" // get value from database
    @Published var remainingFilterTime: Float = 0
    
    @Published var chlorineValue: Float = 0
    @Published var acidValue: Float = 0
    @Published var baseValue: Float = 0
    
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
        
        fTimeData.observe(DataEventType.value, with: { snapshot in
            snapshot.value.map({ fTime in
                self.finishFilteTime = fTime as! String
                print(fTime)
            })
          })
    }
    
    func calculateChlorine() {
        
    }
    
    func calculateacidValue() {
        
    }
    
    func calculatebaseValue() {
        
    }
    
    func calculateFilterTime() {
        let finishFilteTimeFloat = (finishFilteTime as NSString).floatValue
        remainingFilterTime = filterTime / finishFilteTimeFloat
    }
}
