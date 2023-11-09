import SwiftUI

class WeatherAPI {
    private var apiKey = ""
    private var city = "Seoul"

    func loadData(completion: @escaping (Weather?) -> Void){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric&lang=kr") else { fatalError("Invalid URL")}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let result = try? JSONDecoder().decode(Weather.self, from: data)
            if let result = result {
                completion(result)
            } else {
                print("Error decoding data")
                completion(nil)
            }
        }.resume()
    }
}
