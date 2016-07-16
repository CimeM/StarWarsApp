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
import AlamofireImage

/**
 
 Network manager retrieves and parses information from network
 
 */
class NetworkingManager {
    
    
    /**
     
     retrieves data from internet in JSON form, uses completion handler to pass the data
     
     */
    
    func getdatafromURL(url: String, completion: (result: Bool, json: JSON?) -> ()) {
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let jsonResponse = JSON(value)
                    //print("JSON: \(json)")
                    
                    completion(result: true, json: jsonResponse)
                    
                }
            case .Failure(let error):
                print(error)
                completion(result: false, json: JSON(""))
            }
        }
    }
    
    /**
     
     parser for Planet JSON data retrieved from internet
     
     */
    
    func parsePlanetData(data: JSON) -> Planet {
        
        var planet = Planet()
        
        for value in planet.values {
            
            // json data is String
            if let dataValue = data[value].string {
                print(data.count)
                planet.details[value] = dataValue
                
            }
            
            // json data is [String]
            if data[value].array != nil {
                for (_,subJson):(String, JSON) in data[value] {
                    planet.residents.append(subJson.string!)
                }
            }
            
            // json is Int
            if let dataValueInt = data[value].int {
                planet.likes = dataValueInt
                
            }
        }
        return planet
    }
        
    
    /**
     
     parser for Resident JSON data retrieved from internet
     
     */
    func parseResidentData(data: JSON) -> Resident {
        
        var resident = Resident()
        
        for value in resident.values {
            
            // if there is a string, store it accordingly
            if let dataValue = data[value].string {
                print(dataValue.characters.count)
                resident.details[value] = dataValue
                
            }
        }
        
        return resident
    }
    
    /**
     
     downloads the data form internet - used for downloading images.
     TODO - data unavailable
     
     */
    
    func downloadImageFrom(url:String, completion: (result: Bool, image: NSData?) -> ()) {
        
        Alamofire.request(.GET, url).response() {
        
            (_,response, data, _) in
            
            switch response!.statusCode {
            case 200:
                completion(result: true, image: data!)
            default:
                completion(result: false, image: nil)
            }
        }
    }
    
    
    
}