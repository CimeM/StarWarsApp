//
//  networkingManager.swift
//  StarWars
//
//  Created by Martin Cimerman on 14/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON


/**
 
 Network manager retrieves and parses information from network
 
 */
class NetworkingManager {
    
    
    func reachOut() {
        
        Alamofire.request(.GET, "https://private-anon-648f3e5aab-starwars2.apiary-mock.com/planets/10").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
        
    }
    
    
}