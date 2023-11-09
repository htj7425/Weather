struct WeatherViewCellData {
    var main: String
    var condition: String
    var temp: Float
    var temp_min: Float
    var temp_max: Float
    
    init(weathers: WeatherVM, time: Int, rangeIndex: [Int]) {
        let currentIndex = rangeIndex[time/3]
        if let data = weathers.daysWeather?.list?[currentIndex] {
            if let condition = data.weatherCondition?[0].description {
                self.condition = condition
            } else {
                self.condition = "Unknown Condition"
            }
            
            if let main = data.weatherCondition?[0].main {
                self.main = main
            } else {
                self.main = "Unknown Condition"
            }
            
            if let temps = data.weatherDetail {
                self.temp = temps.temp ?? 0.0
            } else {
                self.temp = 0.0
            }
        } else {
            self.main = "Unknown Condition"
            self.condition = "Unknown Condition"
            self.temp = 0.0
        }
        
        var min: Float = 100.0
        var max: Float = -100.0
        
        // 오늘 데이터 중 최저, 최고 기온 추출
        for i in rangeIndex {
            if let temps = weathers.daysWeather?.list?[i].weatherDetail {
                if let minimum = temps.temp_min {
                    min = (min > minimum ? minimum : min)
                }
                if let maximum = temps.temp_max {
                    max = (max < maximum ? maximum : max)
                }
            }
        }
        self.temp_min = min
        self.temp_max = max
    }
}
