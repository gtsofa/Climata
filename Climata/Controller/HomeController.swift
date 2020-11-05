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
    
    let firstChild = TestController()
    let previousLocationVC = PreviousLocationController()
    
    //todo
    weak var conditionImageView: UIImageView!
    weak var temperatureLabel: UILabel!
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
        searchTextField.delegate = self

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
            print("0 selected")
            previousLocationChild()
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            print("1 selected")
            previousLocationVC.willMove(toParent: nil)
            previousLocationVC.view.removeFromSuperview()
            previousLocationVC.removeFromParent()
        }
        else
        {
            //firstChildVC()
        }
        
    }
    //MARK: - Handlers
    func configureNavigationBar() {
        //view.backgroundColor = .white
        assignbackground()
//        navigationController?.navigationBar.barTintColor = .white
//        navigationController?.setNavigationBarHidden(true, animated: false)
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
    
    
    //@objc func
    func setupSearchBar() {
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Candies"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true

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
         control.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 70, paddingLeft: 6, paddingRight: 6)
    }
    
    func firstChildVC() {
        addChild(firstChild)
        view.addSubview(firstChild.view)
        firstChild.didMove(toParent: self)
        setFirstChildVCConstraints()
    }
    
    func setFirstChildVCConstraints() {
        firstChild.view.translatesAutoresizingMaskIntoConstraints = false
        firstChild.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        firstChild.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstChild.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstChild.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func previousLocationChild() {
        addChild(previousLocationVC)
        view.addSubview(previousLocationVC.view)
        previousLocationVC.didMove(toParent: self)
        setPreviousLocationChildConstraint()
        
    }
    
    func setPreviousLocationChildConstraint() {
        previousLocationVC.view.translatesAutoresizingMaskIntoConstraints = false
        previousLocationVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        previousLocationVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        previousLocationVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        previousLocationVC.view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
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

extension HomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //TODO:
    }
 
}

//extension HomeController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let city = searchTextField.text {
//            weatherManager.fetchWeather(cityName: city)
//        }
//        searchTextField.text = ""
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        searchTextField.endEditing(true)
//        return true
//    }
//
//
//}
