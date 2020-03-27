//
//  UserObject.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 26/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import SwiftyJSON

class UserObject {
    

    var pictureURL : String!
    var titleNews : String!
    var descriptionNews : String!
    
    
    required init(json:JSON) {
        pictureURL = json["urlToImage"].stringValue
        titleNews = json["title"].stringValue
        descriptionNews = json["articles"]["description"].stringValue
    }
    
    
}
