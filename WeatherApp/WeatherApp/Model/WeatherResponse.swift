//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//

// MARK: - Weather
struct WeatherResponse: Codable {
    let main: Weather
    let name: String
}


// MARK: - Main
struct Weather: Codable {
    let temp: Double
}
