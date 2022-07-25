import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delagate: WeatherManagerDelegate?
    
    let wheatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0f6503d7e16d184bcc905e908b260428&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(wheatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        print(urlString)
        // 1. create URL
        if let url = URL(string: urlString) {
            print(url)
            // 2. create URL session
            let urlSession = URLSession(configuration: .default)
            // 3. give the session a task
            // let task = urlSession.dataTask(with: url, completionHandler: handler)
            // change with closure
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delagate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delagate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4. start the task
            task.resume()
        }
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            self.delagate?.didFailWithError(error: error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString ?? "Default Data")
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        var weather: WeatherModel? = nil
        do {
            let result =  try decoder.decode(WeatherData.self, from: weatherData)
            let id = result.weather[0].id
            let temp = result.main.temp
            let cityName = result.name
            weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
        } catch {
            self.delagate?.didFailWithError(error: error)
        }
        return weather
    }
}
