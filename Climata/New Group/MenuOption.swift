//
//  MenuOption.swift
//  Climata
//
//  Created by Julius on 04/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    
    case Help
    case Settings
    
    var description: String {
        switch self {
        case .Help: return "Help"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Help: return UIImage(named: "help") ?? UIImage()
        case .Settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
}
