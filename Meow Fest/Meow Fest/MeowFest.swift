//
//  MeowFest.swift
//  Meow Fest
//
//  Created by Sara Ahmad on 1/22/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MeowFest{
    
    var title: String?
    var timeStamp: String?
    var imageUrl: String?
    var description: String?
    
    init(jsonDictionary: [String: Any]) {
        
        guard
            let title = jsonDictionary["title"] as? String,
            let timeStamp = jsonDictionary["timestamp"] as? String,
            let imageUrl = jsonDictionary["image_url"] as? String,
            let description = jsonDictionary["description"] as? String
            else {print("did not unwrap"); return}
        
        self.title = title
        self.timeStamp = timeStamp
        self.imageUrl = imageUrl
        self.description = description
    }
}
