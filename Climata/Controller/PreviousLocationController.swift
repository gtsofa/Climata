//
//  PreviousLocationController.swift
//  Climata
//
//  Created by Julius on 04/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class PreviousLocationController: UIViewController {
    //MARK: - Properties
    //var testArray = ["Los Angeles", "Watamu, Kenya", "Mwiki, Kenya", "Machakos, Kenya", "Nairobi, Kenya"]
    //var testArray = ["200#No previous location#29 C#13.6#10k/h", "Another Location#23C"]
    //WeatherModel(conditionId: T##Int, cityName: <#T##String#>, temperature: <#T##Double#>, humidy: <#T##Double#>, wind: <#T##Double#>))
    //var testArray = ["No Previous location"]
    //var testArray: [WeatherData] = [WeatherData]()
    var testArray: [WeatherData] = [WeatherData]()
    fileprivate let cellId = "previous table cell"
    let locationsTableView = UITableView()
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .yellow
        setTableConstraints()
        
        
    }
    //MARK: - Handlers
    func setTableConstraints() {
        view.addSubview(locationsTableView)
        locationsTableView.register(PreviousLocationCell.self, forCellReuseIdentifier: cellId)
        locationsTableView.delegate = self
        locationsTableView.dataSource = self
        locationsTableView.backgroundColor = .clear
        
        //locationsTableView.backgroundColor = .red
        locationsTableView.translatesAutoresizingMaskIntoConstraints = false
        locationsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        locationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        locationsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        locationsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        //testArray.append()
        
    }
    
    /*func groupLocationBookmarks() {
        let incomingLocationsData = testArray
        
        var locationBookmarks = [WeatherModel]()
        
        for bookmark in incomingLocationsData.enumerated() {
            let bookmarkData = testArray.split(separator: "#")
            let cityName = bookmarkData[0]
        }
        //locationBookmarks.append(WeatherModel(conditionId: <#T##Int#>, cityName: <#T##String#>, temperature: <#T##Double#>, humidy: <#T##Double#>, wind: <#T##Double#>))
    }*/
}

//MARK: - TableView Delegates & DataSource
extension PreviousLocationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PreviousLocationCell
        //cell.textLabel?.text = testArray[indexPath.row]//"Hello man"
        let weatherList = testArray[indexPath.row]
        cell.textLabel?.text = weatherList.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = CityController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    
}
