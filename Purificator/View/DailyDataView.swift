//
//  DailyDataView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/18/22.
//

import SwiftUI

struct DailyDataView: View {
    @StateObject var dailyDataModel = DataViewModel()
    
    var body: some View {
        List {
            ForEach(dailyDataModel.dailyData) { data in
                dailyDataCard(date: data.date)
                Text(data.chlorine)
                Text(data.acid)
                
                Text(String(getChlorinePrice(chlorineValue:data.chlorine)))            }
        }
        
    }
    
    @ViewBuilder
    private func dailyDataCard(date: String) -> some View {
        Text(date)
    }
    
    func getChlorinePrice(chlorineValue: String) -> Float {
        return (dailyDataModel.chlorinePrice * (chlorineValue as NSString).floatValue)
    }
    func getAcidPrice(acidValue: String) -> Float {
        return (dailyDataModel.acidPrice * (acidValue as NSString).floatValue)
    }
    func getBasePrice(baseValue: String) -> Float {
        return (dailyDataModel.basePrice * (baseValue as NSString).floatValue)
    }
    

}

struct DailyDataView_Previews: PreviewProvider {
    static var previews: some View {
        DailyDataView()
    }
}
