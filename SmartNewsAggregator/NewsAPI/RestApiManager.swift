//
//  RestApiManager.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 26/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias   ServiceResponse = (JSON, Error?) -> Void

class RestApiManager: NSObject {
    
    static let sharedInstance = RestApiManager()
    let baseURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=476fe06dbd57453fa954405002e6bf5c"
    

    func getRandomUser(onCompletion:@escaping (JSON) -> Void) {
        let route = baseURL
        makeHTTPGetRequest(path: route) { (json: JSON, error : Error?) in
            onCompletion(json as JSON)
        }
    }
    
    private func makeHTTPGetRequest(path:String, onCompletion: @escaping ServiceResponse) {
        let request = URLRequest(url: NSURL(string: path)! as URL)
        URLSession.shared.dataTask(with: request) {(data:Data?, response: URLResponse?, error:Error?)in
            if let jsonData = data {
                do {
                    let json: JSON = try JSON(data:jsonData)
                    onCompletion(json,nil)
                } catch {
                    onCompletion(JSON(),error)
                }
            }else {
                onCompletion(JSON(),error)
            }
        }.resume()
    }
    
    private func makeHTTPPostRequest(path: String, body:[String:AnyObject], onCompletion: @escaping ServiceResponse) {
        var request = URLRequest(url:NSURL(string:path)! as URL)
        request.httpMethod = "POST"
        
        do {
            let JsonBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = JsonBody
            URLSession.shared.dataTask(with: request) {(data:Data?, response: URLResponse?, error:Error?)in
                if let jsonData = data {
                    do {
                        let json: JSON = try JSON(data:jsonData)
                        onCompletion(json,nil)
                    } catch {
                        onCompletion(JSON(),error)
                    }
                }else {
                    onCompletion(JSON(),error)
                }
                }.resume()
        } catch {
            onCompletion(JSON(),nil)
        }
    }
}
