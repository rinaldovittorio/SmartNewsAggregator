//
//  JsonsFunctions.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 25/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import Foundation
import UIKit


func downloadFileJSON () {
    
    let articles = [Article]()
    var index = 0
    let url = URL (string: "http://newsapi.org/v2/top-headlines?country=us&apiKey=476fe06dbd57453fa954405002e6bf5c")
    
    guard let downloadURL = url else {return}
    URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
        
        guard let data = data, error == nil, urlResponse != nil else {
            print("Something is wrong")
            return
        }
        print("download")
        print(articles)
        
        do {
            let decoder = JSONDecoder
            let downloadedArticles = try decoder.decode(Articles.self, from:data)
            
        }
    }
    
    
}
