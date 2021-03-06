//
//  WeatherModel.swift
//  Climata
//
//  Created by Julius on 06/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let humidy: Double
    let wind: Double
    
    //comp prop for temp as 1decimalplace
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var humidityString: String {
        return String(format: "%.1f", humidy)
    }
    
    var windString: String {
        return String(format: "%.1f", wind)
    }
    
    
    //computed property
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
