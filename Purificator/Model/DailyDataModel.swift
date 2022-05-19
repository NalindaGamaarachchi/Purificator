//
//  DailyDataModel.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/19/22.
//

import Foundation

struct DailyDataModel: Identifiable, Codable {
    var id: String?
    var date: String
    var fTime: String
    var chlorine: String
    var acid: String
    var base: String
}
