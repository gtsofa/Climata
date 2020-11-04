//
//  HomeController.swift
//  Climata
//
//  Created by Julius on 03/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    //MARK: - Properties
    weak var delegate: HomeControllerDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
    var filteredCandies: [String] = [] //[Candy]
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }


    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        //setupSearchBar()
        configureSearchBar()
    }
    //MARK: - Selectors
    @objc func handleMenuToggle() {
        print("menu toggle touched")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    //MARK: - Handlers
    func configureNavigationBar() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .primaryBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "CLIMATA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-icon-1").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func configureSearchBar() {
        let rightNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        searchBar.placeholder = "location"
    }
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
    
    
}

extension HomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //TODO:
    }
    
    
    
    
}
