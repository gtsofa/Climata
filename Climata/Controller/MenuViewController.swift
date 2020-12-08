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
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("C/F", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-location"), for: .normal)
        button.addTarget(self, action: #selector(searchCity), for: .touchUpInside)
        return button
    }()
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - action method
    func configureUI() {
        let stack = UIStackView(arrangedSubviews: [settingsButton, searchButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 80
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 550, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    //MARK: - selectors
    @objc func searchCity() {
        let controller = SearchCityViewController()
        //pop up
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
}
