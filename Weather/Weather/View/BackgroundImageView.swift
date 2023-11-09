//
//  BackgroundImageView.swift
//  Weather
//
//  Created by Taejun Ha on 11/7/23.
//

import SwiftUI

struct BackgroundImageView: View {
    @ObservedObject var weathers: WeatherVM
    
    let time: CurrentTime
    
    var body: some View {
        Image(isTimeImage(time.time))
            .overlay() {
                Rectangle()
                    .opacity(0.2)
            }
    }
}

extension BackgroundImageView {
    func isTimeImage(_ time: Int) -> String {
        if let condition = weathers.daysWeather?.list?[time/3].weatherCondition?[0].main {
            if condition == "rainy" { return "rainy" }
        }
        
        if (time >= 19 && time <= 24) || (time >= 0 && time <= 4) {
            return "night"
        } else if time >= 5 && time <= 18 {
            return "sunny"
        } else {
            return "sunset"
        }
    }
}

#Preview {
    BackgroundImageView(weathers: WeatherVM(), time: CurrentTime())
}
