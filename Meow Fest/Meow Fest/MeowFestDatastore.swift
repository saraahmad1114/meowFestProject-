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
                
                print("****************************")
                print(meowFestObject.title)
                print(meowFestObject.timeStamp)
                print(meowFestObject.imageUrl)
                print(meowFestObject.description)
                print("****************************")
                
                self.meowFestArray.append(meowFestObject)
                
                print("****************************")
                print(self.meowFestArray.count)
                print("****************************")
            }
            completion(self.meowFestArray)
        }
    }
    
    func retrieveNextPageInformation()
    {
        self.page += 1
    }

}
