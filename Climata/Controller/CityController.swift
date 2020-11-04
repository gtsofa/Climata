//
//  CityController.swift
//  Climata
//
//  Created by Julius on 04/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class CityController: UIViewController {
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
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryBlue
        title = "Today's weather"
        setConstraints()
        
    }
    //MARK: - Handlers
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [cityNameLabel, rainChanceLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 90, paddingLeft: 16, paddingRight: 16)
    }
}
