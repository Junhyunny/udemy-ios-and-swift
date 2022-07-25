
struct WeatherData: Decodable {
    let name: String
    let main: Main
    // let weather: Array<Weather>
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
