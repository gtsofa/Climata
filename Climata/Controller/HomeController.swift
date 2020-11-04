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
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBlue
        //title = "Home Screen"
        configureNavigationBar()
    }
    //MARK: - Selectors
    @objc func handleMenuToggle() {
        print("menu toggle touched")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    //MARK: - Handlers
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .primaryColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "CLIMATA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-icon-1").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
