//
//  ContainerController.swift
//  Climata
//
//  Created by Julius on 04/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    //MARK: - Properties
    private let homeController = HomeController()
    var centerController: UIViewController!
    var menuController: MenuController!
    var isExpanded = false
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    //MARK: - Handlers
    
    func configureHomeController() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("did move menu controller")
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            //show menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) {(_) in
                guard let menuOption = menuOption else { return}
                self.didSelectMenuOption(menuOption: menuOption)
                
            }
            
        }
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Help:
            print("Show Help Screen")
        case .Settings:
            print("Show settings screen")
        }
    }
}

extension ContainerController: HomeControllerDelegate {
//    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
//        //
//    }
    
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
}
