//
//  ContentView.swift
//  Weather
//
//  Created by Taejun Ha on 11/5/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var weathers: WeatherVM = WeatherVM()
    let time = CurrentTime()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundImageView(weathers: weathers, time: time)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                
                if weathers.isLoadData {
                    LoadedView(weathers: weathers, time: time)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                } else {
                    LoadingView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    MainView()
}
