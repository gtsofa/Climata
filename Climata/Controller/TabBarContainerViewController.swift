//
//  TabBarContainerViewController.swift
//  Climata
//
//  Created by Julius on 08/12/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class TabBarContainerViewController: UITabBarController {
    //MARK: - Properties
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //create tab 1
        let tabOne = MenuViewController()
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "menu-icon-1"), tag: 1)
        tabOne.tabBarItem = tabOneBarItem
        //create tab 2
        let tabTwo = WebViewController()
        let tabTwoBarItem = UITabBarItem(title: "", image: UIImage(named: "web-view"), tag: 2)
        tabTwo.tabBarItem = tabTwoBarItem
        
        self.viewControllers = [tabOne, tabTwo]
        
    }
    //MARK: - Action methods
}

//MARK: - Delegates
extension TabBarContainerViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print("selected \(viewController.title!)")
    }
    
}
