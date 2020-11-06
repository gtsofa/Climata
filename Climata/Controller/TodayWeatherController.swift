//
//  TodayWeatherController.swift
//  Climata
//
//  Created by Julius on 06/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class TodayWeatherController: UIViewController {
    //MARK: - Properties
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Los Angeles"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var rainChanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Chance of Rain: 3%"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19 C"
        label.font = .systemFont(ofSize: 33)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.text = "wind"
        label.font = .systemFont(ofSize: 10)
        //label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.text = "9 km/h"
        label.font = .boldSystemFont(ofSize: 12)
        //label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var humidityChanceLabel: UILabel = {
        let label = UILabel()
        label.text = "humidity"
        label.font = .systemFont(ofSize: 10)
        //label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.text = "78%"
        label.font = .boldSystemFont(ofSize: 12)
        //label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let weatherIconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        //icon.backgroundColor = .blue
        return icon
    }()
    
    private let weatherIconImage: UIImageView = {
        let saveImageView = UIImageView()
        saveImageView.image = UIImage(named: "weather-icon")
        saveImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true//40
        saveImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true//60
        //saveImageView.backgroundColor = .darkGray
        //saveImageView.layer.cornerRadius = 45
        return saveImageView
        
    }()
    
    let fiveDaysWeatherVC = FutureWeatherController()
    
    var weatherManager = WeatherManager()
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        assignbackground()
        weatherManager.delegate = self
        
        
    }
    //MARK: - Handlers
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [cityNameLabel, rainChanceLabel])
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 16)
        view.addSubview(weatherIconImage)
        weatherIconImage.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 120, paddingLeft: 120, paddingRight: 210)
        view.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 120, paddingLeft: 200, paddingRight: 80)
        
        let windstack = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        windstack.axis = .vertical
        windstack.spacing = 10
        windstack.distribution = .fillEqually
        view.addSubview(windstack)
        windstack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 200, paddingLeft: 32, paddingRight: 16)
        
        let humiditystack = UIStackView(arrangedSubviews: [humidityChanceLabel, humidityValueLabel])
        humiditystack.axis = .vertical
        humiditystack.spacing = 10
        humiditystack.distribution = .fillEqually
        view.addSubview(humiditystack)
        humiditystack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 200, paddingLeft: 280, paddingRight: 16)
    }
    
    func assignbackground(){
        let background = UIImage(named: "bg-15")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    
//    func didUpdateWeather(weather: WeatherModel) {
//        print("today's weather temperature: \(weather.temperature)")
//    }

}

extension TodayWeatherController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print("home: \(weather.temperature)")
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

}


