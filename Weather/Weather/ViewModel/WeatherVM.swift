import SwiftUI

class WeatherVM: ObservableObject {
    @Published var daysWeather: Weather?
    @Published var isLoadData = false
    
    init() {
        WeatherAPI().loadData{ result in
            DispatchQueue.main.async {
                if let result = result {
//                    print(result)
                    self.daysWeather = result
                    self.isLoadData = true
                }
            }
        }
    }
}
