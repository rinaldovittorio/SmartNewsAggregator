//
//  Services.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 24/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents

class Service {
    static let baseColor = UIColor(r: 254, g: 202, b: 64)
    static  let darkBasedColor = UIColor (r: 253, g: 165, b: 47)
    static  let unselectedItemColor = UIColor(r: 173, g: 173, b: 173)
    
    static func showAlert(on: UIViewController, style: UIAlertController.Style, title: String?, message: String?, actions:[UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)], completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        on.present(alert, animated: true, completion: completion)
        
    }
}

