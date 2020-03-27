//
//  MainTabController.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 24/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class MainTabController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor( r:0, g:244, b:103)
        setupViewControllers()
        loginStatus()
    }
    
    fileprivate func loginStatus() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let loginNavigationController = UINavigationController(rootViewController: loginController)
                self.present(loginNavigationController, animated: true, completion: nil)
                return
            }
        }
    }
    
    fileprivate func setupViewControllers() {
        
        // # Home Controller #
        let homeController = HomeController()
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        
        //# Icon to the home controller #
        
        homeNavigationController.tabBarItem.title = "Home"
        homeNavigationController.tabBarItem.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        homeNavigationController.tabBarItem.selectedImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        
        // # User Controller ##
        
        let userProfileController = UserProfileController()
        let userProfileNavigaionController = UINavigationController(rootViewController: userProfileController)
        
        //## Icon to the User Profile ##
        
        userProfileNavigaionController.tabBarItem.title = "Account"
        userProfileNavigaionController.tabBarItem.image = UIImage(named: "account")?.withRenderingMode(.alwaysTemplate)
        userProfileNavigaionController.tabBarItem.selectedImage = UIImage(named: "account")?.withRenderingMode(.alwaysOriginal)
        
        // News Controller //
        
        let newsController = NewsController(collectionViewLayout: UICollectionViewFlowLayout())
        let newsNavigationController = UINavigationController(rootViewController: newsController)
        
        newsNavigationController.tabBarItem.title = "News"
        newsNavigationController.tabBarItem.image = UIImage(named: "live")?.withRenderingMode(.alwaysTemplate)
        newsNavigationController.tabBarItem.selectedImage = UIImage(named: "live")?.withRenderingMode(.alwaysOriginal)
        
        // Search Controller //
        
        let searchController = SearchController()
        let searchNavigationController = UINavigationController(rootViewController: searchController)
        
        searchNavigationController.tabBarItem.title = "Search"
        searchNavigationController.tabBarItem.image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        searchNavigationController.tabBarItem.selectedImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        
        // declaring the controllers
        
        viewControllers = [homeNavigationController,newsNavigationController,searchNavigationController,userProfileNavigaionController]
        
        guard let items = tabBar.items else {return }
        for item in items {
            item.imageInsets = UIEdgeInsets (top: 4, left: 0, bottom : -4, right: 0)
        }

    }
    

    
}
