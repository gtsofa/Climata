//
//  HomeController.swift
//  Climata
//
//  Created by Julius on 03/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITextFieldDelegate{
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
    private lazy var searchTextField: UITextField = {
        let mobile = UITextField()
        mobile.placeholder = "Search location"
        mobile.setLeftPaddingPoints(10)
        mobile.backgroundColor = .white
        mobile.layer.cornerRadius = 10
        mobile.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return mobile
    }()
    weak var delegate: HomeControllerDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    var filteredCandies: [String] = [] //[Candy]
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var control = UISegmentedControl()
    
    let previousLocationVC = PreviousLocationController()
    
    let todayWeatherVC = TodayWeatherController()
    
    weak var conditionImageView: UIImageView!
    //weak var temperatureLabel: UILabel!
    weak var cityLabel: UILabel!
    //weak var searchTextField: UITextField!
    
    
    var weatherManager = WeatherManager()
    

    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        //setupSearchBar()
        configureSearchBar()
        addSegmentedControl()
        previousLocationChild()
        //todayWeatherChild()
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        //configureUI()
        setConstraints()

    }
    //MARK: - Selectors
    @objc func handleMenuToggle() {
        print("menu toggle touched")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @objc func shareTapped() {
        print("menu toggle touched")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @objc func addTapped() {
        searchTextField.endEditing(true)
    }
    
    @objc func tapSegmented(_ segmentedControl: UISegmentedControl) {
        print("segmented tapped.")
        if segmentedControl.selectedSegmentIndex == 0 {
            previousLocationChild()
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            previousLocationVC.willMove(toParent: nil)
            previousLocationVC.view.removeFromSuperview()
            previousLocationVC.removeFromParent()
        }
        
    }
    //MARK: - Handlers
    func configureUI() {
        view.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 16, paddingRight: 16)
    }
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [cityNameLabel, rainChanceLabel])
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 70, paddingLeft: 16, paddingRight: 16)
        view.addSubview(weatherIconImage)
        weatherIconImage.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 140, paddingLeft: 100, paddingRight: 210)
        view.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 140, paddingLeft: 180, paddingRight: 80)
        
        let windstack = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        windstack.axis = .vertical
        windstack.spacing = 10
        windstack.distribution = .fillEqually
        view.addSubview(windstack)
        windstack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 220, paddingLeft: 32, paddingRight: 16)
        
        let humiditystack = UIStackView(arrangedSubviews: [humidityChanceLabel, humidityValueLabel])
        humiditystack.axis = .vertical
        humiditystack.spacing = 10
        humiditystack.distribution = .fillEqually
        view.addSubview(humiditystack)
        humiditystack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 220, paddingLeft: 280, paddingRight: 16)
    }
    func configureNavigationBar() {
        assignbackground()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        //title = "CLIMATA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-icon-1").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func configureSearchBar() {
        
        let rightNavBarButton = UIBarButtonItem(customView: searchTextField)
        //self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [search, rightNavBarButton]
        
        searchBar.placeholder = "location"
        searchTextField.endEditing(true)
        
    }
    
    func addSegmentedControl() {
        let segmentItems = ["Previous Locations", "Add New Location"]
        control = UISegmentedControl(items: segmentItems)
        //control.backgroundColor = .white
        control.layer.borderWidth = 1.0
        control.layer.cornerRadius = 5.0
        control.layer.borderColor = UIColor.white.cgColor
        control.layer.masksToBounds = false
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        control.selectedSegmentIndex = 0
        control.frame = CGRect(x: 10, y: 250, width: (self.view.frame.width - 20), height: 50)
         control.addTarget(self, action: #selector(tapSegmented), for: .valueChanged)
        view.addSubview(control)
         control.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 280, paddingLeft: 6, paddingRight: 6)
    }
    
    func todayWeatherChild() {
        addChild(todayWeatherVC)
        view.addSubview(todayWeatherVC.view)
        todayWeatherVC.didMove(toParent: self)
        setTodayWeatherChildConstraint()
        
    }
    
    func setTodayWeatherChildConstraint() {
        todayWeatherVC.view.translatesAutoresizingMaskIntoConstraints = false
        todayWeatherVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        todayWeatherVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        todayWeatherVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        todayWeatherVC.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        todayWeatherVC.view.layer.cornerRadius = 25
        todayWeatherVC.view.layer.masksToBounds = true
        todayWeatherVC.view.backgroundColor = .white
    }
    
    func previousLocationChild() {
        addChild(previousLocationVC)
        view.addSubview(previousLocationVC.view)
        previousLocationVC.didMove(toParent: self)
        setPreviousLocationChildConstraint()
        
    }
    
    func setPreviousLocationChildConstraint() {
        previousLocationVC.view.translatesAutoresizingMaskIntoConstraints = false
        previousLocationVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        previousLocationVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        previousLocationVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        previousLocationVC.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        previousLocationVC.view.layer.cornerRadius = 25
        previousLocationVC.view.layer.masksToBounds = true
        previousLocationVC.view.backgroundColor = .white
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
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something"
            return true
        }
    }

}

//MARK: - Extensions

extension HomeController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print("home: \(weather.temperature)")
        DispatchQueue.main.async {
            self.temperatureLabel.text = "\(weather.temperatureString) C"
            self.cityNameLabel.text = "\(weather.cityName)"
            self.weatherIconImage.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

}

