//
//  WeatherListViewModelTests.swift
//  WeatherAppTests
//
//  Created by Yogini Unde on 16/10/23.
//

import XCTest
@testable import WeatherApp

class WeatherListViewModelTests: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.weatherListVM = WeatherListViewModel()
       
        self.weatherListVM.AddWeatherVieModel(WeatherViewModel(weather: WeatherResponse(main: Weather(temp: 32), name: "Pune")))
        
        self.weatherListVM.AddWeatherVieModel(WeatherViewModel(weather: WeatherResponse(main: Weather(temp: 72), name: "Mumbai")))
    }

    func test_should_be_able_to_convert_to_celsius_successfully() {
        
        let celsiusTemperatures = [0,22.2222]
        self.weatherListVM.updateUnit(to: .celsius)
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.temp), round(celsiusTemperatures[index]))
        }
    }
    
    override func tearDown() {
       super.tearDown()
    }
}
