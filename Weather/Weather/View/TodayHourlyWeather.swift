//
//  TodayHourlyWeather.swift
//  Weather
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct TodayHourlyWeather: View {
    @ObservedObject var weathers: WeatherVM
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach((0..<8), id: \.self) { index in
                    TodayHourlyWeatherContent(item: weathers.daysWeather?.list?[index], index: index)
                }
            }
            .foregroundStyle(.white)
        }
        
    }
}

struct TodayHourlyWeatherContent: View {
    let item: WeatherList?
    let index: Int
    
    var body: some View {
        VStack {
            Text("\(index*3)시")
            
            VStack{
                conditionImage(item?.weatherCondition?[0].main ?? "")
                    .resizable()
                    .frame(maxWidth: 50, maxHeight: 50)
                    .scaledToFit()
                    .padding(.vertical)
            }
            .frame(maxWidth: 75, maxHeight: 75)
            Text("\(String(format: "%.0f", item?.weatherDetail?.temp ?? 0.0))º")
        }
        .frame(maxHeight: 150)
        .padding()
    }
}



#Preview {
    TodayHourlyWeather(weathers: WeatherVM())
}
