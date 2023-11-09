import SwiftUI

struct Weather: Decodable {
    var list: [WeatherList]?
    var city: City?
}

struct WeatherList: Decodable {    
    var weatherDetail: Main?
    var weatherCondition: [Conditions]?
    
    enum CodingKeys: String, CodingKey {
        case weatherDetail = "main"
        case weatherCondition = "weather"
    }
    
    var clouds: Cloud?
    var wind: Wind?
    var visibility: Int?
    var rain: Rain?
    var snow: Snow?
    
//    var dt_txt: String?
//    var sys: Sys?
}

struct Conditions: Decodable, Identifiable {
    var id: Int? // 날씨 정도에 따른 ID 값임 rain에서 비오는 정도에 따라 id 값이 다름
    var main: String? // 날씨 그룹 (비, 눈, 구름 등)
    var description: String? // 날씨에 대한 설명
    var icon: String? // 날씨 icon ID
}

struct Main: Decodable {
    var temp: Float? // 온도
    var feels_like: Float? // 체감 온도
    var temp_min: Float?
    var temp_max: Float?
    var pressure: Float?
    var humidity: Float?
    var sea_level: Float?
    var grnd_level: Float?
}

struct Wind: Decodable {
    var speed: Float?
    var deg: Float?
    var gust: Float?
}

struct Rain: Decodable {
    var lastHour: Float?
    var last3Hours: Float?
    
    private enum CodingKeys: String, CodingKey {
        case lastHour = "1h"
        case last3Hours = "3h"
    }
}

struct Snow: Decodable {
    var lastHour: Float?
    var last3Hours: Float?
    
    private enum CodingKeys: String, CodingKey {
        case lastHour = "1h"
        case last3Hours = "3h"
    }
}

struct Cloud: Decodable {
    var percentage: Int?
    
    private enum CodingKeys: String, CodingKey {
        case percentage = "all"
    }
}

struct City: Decodable, Identifiable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    var sunrise: Int?
    var sunset: Int?
}

struct Coord: Decodable {
    var lat: Float?
    var lon: Float?
}
