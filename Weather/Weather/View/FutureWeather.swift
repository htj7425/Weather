//
//  FutureWeather.swift
//  Weather
//
//  Created by Taejun Ha on 11/7/23.
//

import SwiftUI

struct FutureWeather: View {
    @ObservedObject var weathers: WeatherVM
    let time: CurrentTime
    let days = getDaysOfWeekFromDate(date: Date(), count: 5)
    
    let daysRangeIndex = [
        Array(8...15),
        Array(16...23),
        Array(24...31),
        Array(32...39)
    ]
    
    var body: some View {
        ForEach((0..<4)) { index in
            FutureWeatherCellView(data: WeatherViewCellData(weathers: weathers, time: time.time, rangeIndex: daysRangeIndex[index]), day: days[index])
        }
        .padding()
    }
}

func getDaysOfWeekFromDate(date: Date, count: Int) -> [String] {
    let calendar = Calendar.current
    var daysOfWeek: [String] = []
    
    for i in 0..<count {
        if let nextDate = calendar.date(byAdding: .day, value: i, to: date) {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEEEE"
            formatter.locale = Locale(identifier: "ko_KR")
            let dayOfWeek = formatter.string(from: nextDate)
            daysOfWeek.append(dayOfWeek)
        }
    }
    
    return daysOfWeek
}

#Preview {
    FutureWeather(weathers: WeatherVM(), time: CurrentTime())
}
