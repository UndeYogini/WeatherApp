//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//

class WeatherListViewModel {
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    func AddWeatherVieModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func ModelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
        
        weatherViewModels = weatherViewModels.map { vm in
            
            let weatherModel = vm
            weatherModel.temp = (weatherModel.temp - 32) * 5/9
            return weatherModel
            
        }
    }
    
    private func toFahrenheit() {
        
        weatherViewModels = weatherViewModels.map { vm in
            
            let weatherModel = vm
            weatherModel.temp = (weatherModel.temp * 9/5) + 32
            return weatherModel
            
        }
    }
    
    func updateUnit(to unit: Unit) {
        
        switch unit {
            case .celsius:
                toCelsius()
            case .fahrenheit:
                toFahrenheit()
        }
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temp : Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temp = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
}
