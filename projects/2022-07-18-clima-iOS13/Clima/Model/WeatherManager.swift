import Foundation

struct WeatherManager {
    
    let wheatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0f6503d7e16d184bcc905e908b260428&unit=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(wheatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
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
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            // 4. start the task
            task.resume()
        }
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let result =  try decoder.decode(WeatherData.self, from: weatherData)
            print(result)
        } catch {
            print(error)
        }
    }
}
