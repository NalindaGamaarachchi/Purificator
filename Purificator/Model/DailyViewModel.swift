//
//  DailyViewModel.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/19/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseDatabaseSwift
import CoreData

class DataViewModel: ObservableObject {
    
    @Published var dailyData: [DailyDataModel] = []
    
    @Published var totalChlorinePrice: Float = 0
    @Published var totalAcidPrice: Float = 0
    @Published var totalBasePrice: Float = 0
    @Published var totalPrice: Float = 0
    
    @Published var chlorinePrice: Float = 0.2
    @Published var acidPrice: Float = 0
    @Published var basePrice: Float = 0
    
    let databasePath = Database.database().reference().child("DailyData")
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        loadModel()
    }
    
    func loadModel() {
        databasePath
          .observe(.childAdded) { [weak self] snapshot in
            guard
              let self = self,
              let json = snapshot.value as? [String: Any]
            else {
              return
            }

            do {
              let dailyData = try JSONSerialization.data(withJSONObject: json)
              let data = try self.decoder.decode(DailyDataModel.self, from: dailyData)
              self.dailyData.append(data)
            } catch {
              print("an error occurred", error)
            }
          }
    }
    
    
}
