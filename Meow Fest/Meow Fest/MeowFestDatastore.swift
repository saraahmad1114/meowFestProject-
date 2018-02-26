//
//  MeowFestDatastore.swift
//  Meow Fest
//
//  Created by Sara Ahmad on 1/22/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MeowFestDatastore{
    
    static let sharedInstance = MeowFestDatastore()
    private init() {}
    
    var meowFestArray = [MeowFest]()
    var page = 0
    
    func getMeowFestInformation (page: Int, completion:@escaping ([MeowFest]) -> ()){
        MeowFestAPIClient.getMeowFestInformation(page: page) { (meowFestJsonArray) in
            for singleDictionary in meowFestJsonArray {
                guard let unwrappedSingleDictionary = singleDictionary as? [String: Any] else{print("unwrappedSingleDictionary did not unwrap"); return}
                let meowFestObject = MeowFest.init(jsonDictionary: unwrappedSingleDictionary)
                self.meowFestArray.append(meowFestObject)
            }
            completion(self.meowFestArray)
        }
    }
    
    func retrieveNextPageInformation()
    {
        self.page += 1
    }

}
