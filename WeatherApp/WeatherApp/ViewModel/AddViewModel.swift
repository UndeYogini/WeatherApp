//
//  AddViewModel.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//

import Foundation

class AddViewModel {
    
    func AddWeather(city: String, completion: @escaping (WeatherViewModel) -> Void ) {
        let weatherURL = Constant.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { (result) in
            
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
            else {
                print("nil")
            }
        }
    }
}
