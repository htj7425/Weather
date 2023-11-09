//
//  TodayWeather.swift
//  Weather
//
//  Created by Taejun Ha on 11/7/23.
//

import SwiftUI

struct TodayWeather: View {
    @ObservedObject var weathers: WeatherVM
    
    //현재 시간
    let time: CurrentTime
    
    // 날씨
    @State private var condition: String = "맑음"
    
    //현재 기온, 최저 기온, 최고 기온
    @State private var temp: Float = 0.0
    @State private var temp_min: Float = 0.0
    @State private var temp_max: Float = 0.0
    
    var body: some View {
        VStack {
            //위치
            Text("Seoul")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            //날씨
            Text(condition)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            //현재 기온
            Text("\(tempGetter(temp: temp))º")
                .foregroundStyle(.white)
                .font(.system(size: 70))
            
            
            
            //최저 기온, 최고 기온
            HStack {
                Text("최저: \(tempMinGetter(temp: temp_min))º")
                Text("최고: \(tempMaxGetter(temp: temp_max))º")
            }
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
        }
        //지워줘야함
//        .background(.black)
        .onAppear(){
            let cellData = WeatherViewCellData(weathers: weathers, time: time.time, rangeIndex: Array(0...7))
            
            self.condition = cellData.condition
            self.temp = cellData.temp
            self.temp_max = cellData.temp_max
            self.temp_min = cellData.temp_min
        }
    }
}

#Preview {
    TodayWeather(weathers: WeatherVM(), time: CurrentTime())
}
