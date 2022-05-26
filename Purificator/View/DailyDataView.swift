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
                dailyDataCard(date: data.date, spendChlorine: data.chlorine, filterTime: String(getFilterTime(filterTimeInMin: data.fTime)), totalPrice: String(getChlorinePrice(chlorineValue:data.chlorine)))
            }
        }
        .listRowInsets(EdgeInsets())
        
    }
    
    @ViewBuilder
    private func dailyDataCard(date: String, spendChlorine: String, filterTime: String, totalPrice: String ) -> some View {
        VStack(alignment: .leading) {
            Text(date)
                .foregroundColor(.black)
                .font(.system(size: 18).bold())
            Divider()
                .padding(.all, 0)
            HStack {
                
                dailyDataCardSmall(name: "Chlorine", data: "\(spendChlorine)g", fontSize: 25)
                Divider()
                    .background(Color("Primary"))
                    .padding(.all, 2)
                dailyDataCardSmall(name: "Filter Time", data: "\(filterTime)h", fontSize: 25)
                Divider()
                    .background(Color("Primary"))
                    .padding(.all, 2)
                dailyDataCardSmall(name: "Spend", data: "Rs.\(totalPrice)", fontSize: 20)
                
            }
        }
        .padding()
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        .border(Color("Primary"))
        
    }
    
    private func dailyDataCardSmall(name: String, data: String, fontSize: CGFloat) -> some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.system(size: 15).bold())
            Text(data)
                .font(.system(size: fontSize).bold())
                .foregroundColor(Color("Primary"))
        }
        
        
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
    
    func getFilterTime(filterTimeInMin: String) -> Int {
        let filterTime = Int(filterTimeInMin) ?? 360
        return ( filterTime / 60)
    }
}

struct DailyDataView_Previews: PreviewProvider {
    static var previews: some View {
        DailyDataView()
    }
}
