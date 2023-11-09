import SwiftUI

struct LoadedView: View {
    @ObservedObject var weathers: WeatherVM
    let time: CurrentTime
    var body: some View {
        VStack {
//            Spacer()
            Spacer()
            TodayWeather(weathers: weathers, time: time)
            Spacer()
            TodayHourlyWeather(weathers: weathers)
            Spacer()
            Spacer()
            FutureWeather(weathers: weathers, time: time)
            Spacer()
            Spacer()
        }
    }
}


#Preview {
    LoadedView(weathers: WeatherVM(), time: CurrentTime())
}
