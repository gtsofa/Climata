//
//  WeatherData.swift
//  Climata
//
//  Created by Julius on 06/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
