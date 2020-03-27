//
//  LoginController.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 24/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import JGProgressHUD

class LoginController: UIViewController {
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    
    
    lazy var signInAnonymuslyButton: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("Sign In Anonymously", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(r:0, g:0, b:0)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleSignInAnonimouslyButtonTapped), for: .touchUpInside
        )
        return button
    } ()
    @objc  func handleSignInAnonimouslyButtonTapped() {
        hud.textLabel.text = "Sign In Anonymously..."
        hud.show(in: view, animated: true)
        Auth.auth().signInAnonymously { (user, err) in
            if let err = err {
                self.hud.dismiss(animated: true)
                print("Failed to signin in anonymously with error", err)
                Service.showAlert(on: self, style: .alert, title: "Sign In Error", message: err.localizedDescription)
                return
            }
            print("successufully signed in anonimously with uid:", user?.additionalUserInfo)
            self.hud.dismiss(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 244, g:233, b:0)
        navigationItem.title = "Welcome"
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 330, height: 21))
        label.center = CGPoint(x: 200, y: 330)
        label.textAlignment = .center
        label.text = "The New Smart News Aggregator"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        self.view.addSubview(label)
        
        
        
        var imageLogo : UIImageView
        imageLogo = UIImageView(frame:CGRect(x:130, y:150
            , width:128, height:128))
        imageLogo.image = UIImage(named:"livelogo")
        self.view.addSubview(imageLogo)
        setupViews()
    }
    
    fileprivate func setupViews() {
        //view.addSubview(logo)
        view.addSubview(signInAnonymuslyButton)
        
        
        //center = CGPoint(x: view.center.x, y: view.frame.height - signInAnonymuslyButton.frame.height - 24)
        
        signInAnonymuslyButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom:nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 340, leftConstant: 16, bottomConstant:0 , rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
    }
    
    
  
 
}

