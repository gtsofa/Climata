//
//  WeatherManager.swift
//  Climata
//
//  Created by Julius on 05/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=62470095f3709929d14ddc5b0e009a0a"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("url string \(urlString)")
    }
}
