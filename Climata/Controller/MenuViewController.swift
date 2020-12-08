//
//  MenuViewController.swift
//  Climata
//
//  Created by Julius on 08/12/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    //MARK: - Properties
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
