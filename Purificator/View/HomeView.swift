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
                    .padding(.bottom)

                titleView(title:"Today chamical")
                CalculatedData()
                Divider()
                    .background(Color.black.opacity(0.7))
                    .padding(.bottom)
                
                titleView(title:"Filter time")
                filterTime(filterTime: data.filterTime, finishFilteTime: data.finishFilteTime)
                
                Divider()
                    .background(Color.black.opacity(0.7))
                    .padding(.bottom)
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
    private func filterTime(filterTime: Float, finishFilteTime: String) -> some View {
        
        let finishFilteTimeFloat = (finishFilteTime as NSString).floatValue
        let remainingFilterTime = filterTime - finishFilteTimeFloat
        let filterPercentage =  (finishFilteTimeFloat * 100) / filterTime
        
        VStack {
            HStack {
                progressBar(percentage: CGFloat(filterPercentage))
                Text(String(format: "/ %.1fh", filterTime / 60))
            }
            Text(String(format: "Remaining Filter Time: %.1fh", remainingFilterTime / 60))
        }
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
    
    @ViewBuilder
    private func progressBar(percentage: CGFloat) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: getRect().width / 1.5, height: 30)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: (getRect().width / 150) * percentage, height: 30) // width / 100
                .background(LinearGradient(colors: [Color("Primary"), Color("Bg").opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                )
                .foregroundColor(.clear)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
