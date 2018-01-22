//
//  MeowFestAPIClient.swift
//  Meow Fest
//
//  Created by Sara Ahmad on 1/22/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MeowFestAPIClient{
    
    class func getMeowFestInformation (page: Int, completion: @escaping(Array<Any>)-> ()){
        
        var meowFestJsonArray = Array<Any>()
        
        let meowFestUrl = "https://chex-triplebyte.herokuapp.com/api/cats?page=\(page)"
        
        let convertedUrl = URL(string: meowFestUrl)
        
        guard let unwrappedConvertedUrl = convertedUrl else {print("unwrappedConvertedUrl did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else {print("unwrappedData did not unwrap"); return}
            
            var jsonArray = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! Array<Any>
            
            guard let unwrappedJsonArray = jsonArray else {print("unwrappedJsonArray did not unwrap"); return}
            
            meowFestJsonArray = unwrappedJsonArray
            
            completion(meowFestJsonArray)
        }
        task.resume()
    }
}
