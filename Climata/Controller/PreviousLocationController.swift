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
    var testArray = ["Los Angeles", "Watamu, Kenya", "Mwiki, Kenya", "Machakos, Kenya", "Nairobi, Kenya"]
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
        
        locationsTableView.backgroundColor = .white
        locationsTableView.translatesAutoresizingMaskIntoConstraints = false
        locationsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        locationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        locationsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        locationsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

//MARK: - TableView Delegates & DataSource
extension PreviousLocationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PreviousLocationCell
        cell.textLabel?.text = testArray[indexPath.row]//"Hello man"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = CityController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    
}
