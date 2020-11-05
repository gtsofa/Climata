//
//  PreviousLocationCell.swift
//  Climata
//
//  Created by Julius on 04/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class PreviousLocationCell: UITableViewCell {
    //MARK: - Properties
    let menuIconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        return icon
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        //label.text = "Sample location"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(menuIconImageView)
        addSubview(descriptionLabel)
        menuIconImageView.translatesAutoresizingMaskIntoConstraints = false
        menuIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        menuIconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        menuIconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        menuIconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: menuIconImageView.rightAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
