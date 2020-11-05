//
//  WeatherManager.swift
//  Climata
//
//  Created by Julius on 05/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import Foundation
import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=62470095f3709929d14ddc5b0e009a0a"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("url string \(urlString)")
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //create a URL
        if let url = URL(string: urlString) {
            //create a URLSession
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print("Response data string:\n \(dataString!)")
                }
            }
            
            //start the task
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse, error: Error?) {
        //
    }
}
