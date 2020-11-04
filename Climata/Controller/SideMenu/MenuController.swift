//
//  MenuController.swift
//  Climata
//
//  Created by Julius on 04/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    //MARK: - Properties
    let menuTableView = UITableView()
    fileprivate var reuseIndentifier = "MenuOptionCell identified"
    var delegate: HomeControllerDelegate?
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setTabliewConfig()
    }
    //MARK: - Handlers
    func setTabliewConfig() {
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIndentifier)
        menuTableView.backgroundColor = .darkGray
        menuTableView.separatorStyle = .none
        menuTableView.rowHeight = 80
        
        //constraints
        view.addSubview(menuTableView)
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
}


//MARK: - TableView Datasource
extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.menuIconImageView.image = menuOption?.image
        
        return cell
    }
    
    
}
