import SwiftUI

func conditionImage(_ condition: String) -> Image {
    switch condition {
    case "Rain": Image(systemName: "cloud.rain.fill")
    case "Clouds": Image(systemName: "cloud.fill")
    case "Thunderstorm": Image(systemName: "cloud.bolt.rain.fill")
    case "Drizzle": Image(systemName: "cloud.drizzle.fill")
    case "Snow": Image(systemName: "cloud.snow.fill")
    case "Clear": Image(systemName: "sun.min.fill")
    default: Image(systemName: "sun.dust.fill")
    }
}
