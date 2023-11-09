//
//  FutureWeatherCellView.swift
//  Weather
//
//  Created by Taejun Ha on 11/9/23.
//

import SwiftUI

struct FutureWeatherCellView: View {
    let data: WeatherViewCellData
    let day: String
    
    var body: some View {
        HStack {
            Text("\(day)요일")
                .font(.title3)
            Spacer()
            
            conditionImage(data.condition)
                .font(.title3)
            Spacer()
            
            HStack {
                Text("\(tempMaxGetter(temp: data.temp_max))º")
                    .font(.title3)
                    .frame(maxWidth: 37.5)
                    .multilineTextAlignment(.trailing)
                Spacer()
                Text("\(tempMinGetter(temp: data.temp_min))º")
                    .font(.title3)
                    .frame(maxWidth: 37.5)
                    .multilineTextAlignment(.trailing)
            }
            .frame(maxWidth: 80)
        }
        .foregroundStyle(.white)
        .padding(5)
    }
}



#Preview {
    FutureWeatherCellView(data: WeatherViewCellData(weathers: WeatherVM(), time: CurrentTime().time, rangeIndex: Array(0...7)), day: "목")
}
