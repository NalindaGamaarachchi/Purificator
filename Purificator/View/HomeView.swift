//
//  HomeView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/15/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var data: DataModel = DataModel()
    
    
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                titleView(title:"Today's Data")
                rawData()
                Divider()
                    .background(Color.black.opacity(0.7))

                titleView(title:"Today chamical")
                CalculatedData()
                Divider()
                    .background(Color.black.opacity(0.7))
                
                titleView(title:"Filter time")
                //Data
                Divider()
                    .background(Color.black.opacity(0.7))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top)

        }
        .onAppear{
            data.readData()
        }
    }
    
    @ViewBuilder
    private func titleView(title: String) -> some View {
        Text(title)
            .font(.system(size: 23).bold())
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("Primary"))
            .padding(8)
        
    }
    
    @ViewBuilder
    private func rawData() -> some View {
        HStack {
            rawDataCard(valueName: "Ph", value: data.phvalue, unit: "pH")
            rawDataCard(valueName: "Temperature", value: data.tempvalue, unit: "°C")
            rawDataCard(valueName: "Water Flow", value: data.wFlowvalue, unit: "gpm")
        }
    }
    
    @ViewBuilder
    private func CalculatedData() -> some View {
        HStack {
            CalculatedDataCard(valueName: "Chlorine", value: String(data.chlorineValue))
            CalculatedDataCard(valueName: "Acid", value: String(data.acidValue))
            CalculatedDataCard(valueName: "Base", value: String(data.baseValue))
        }
    }
    
    @ViewBuilder
    private func filterTime() -> some View {
        // add progress bar
        Text(String(data.remainingFilterTime))
        Text(String(data.filterTime))
    }
    
    @ViewBuilder
    private func rawDataCard(valueName: String, value: String, unit: String) -> some View {
        VStack(alignment: .leading) {
            Text(valueName)
                .foregroundColor(.black)
                .font(.system(size: 15).bold())
                .padding(.leading, 10)
            HStack(alignment: .bottom, spacing: 2) {
                Text(value)
                    .padding(.leading, 10)
                    .font(.system(size: 40).bold())
                    .foregroundColor(Color("Primary"))
                Text(unit)
                    .foregroundColor(.white)
                    .font(.system(size: 15).bold())
                    .padding(.bottom, 8)
            }
            
        }
        .frame(width: getRect().width / 3.3, height: 120, alignment: .leading)
        .background(LinearGradient(colors: [Color("Bg").opacity(0.3), Color("Primary").opacity(0.3)], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }
    
    @ViewBuilder
    private func CalculatedDataCard(valueName: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(valueName)
                .foregroundColor(.black)
                .font(.system(size: 15).bold())
                .padding(.leading, 10)
            Text(value)
                .padding(.leading, 10)
                .font(.system(size: 30).bold())
                .foregroundColor(Color("Primary"))
  
        }
        .frame(width: getRect().width / 3.3, height: 120, alignment: .leading)
        .background(LinearGradient(colors: [Color("Bg").opacity(0.5), Color("Primary").opacity(0.3)], startPoint: .bottom, endPoint: .top))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
