//
//  UserController.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 24/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class UserProfileController: UIViewController {
    override func  viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "User Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Sign Out", style: .done, target: self, action: #selector(signoutButtonTapped))
    }
    @objc func signoutButtonTapped() {
        
        let signOutAction = UIAlertAction(title:"Sign Out", style:.destructive) { (action) in
            do {
                try Auth.auth().signOut()
                let loginController = LoginController()
                let loginNavigationController = UINavigationController(rootViewController: loginController)
                self.present(loginNavigationController, animated: true, completion: nil)
            } catch let err {
                print("Failed to sign out with error", err)
                Service.showAlert(on: self, style: .alert, title: "Sign Out Error", message: err.localizedDescription)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        Service.showAlert(on: self, style: .actionSheet, title: nil, message: nil, actions: [signOutAction, cancelAction], completion: nil)
        
    }
}

