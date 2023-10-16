//
//  StringEscaped.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//


extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
