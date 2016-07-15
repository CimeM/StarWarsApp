//
//  informationManager.swift
//  StarWars
//
//  Created by Martin Cimerman on 14/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import Foundation
import UIKit

/**
 
 Called upon user request. 
 
 */

class InformationManager {
    
    var localDataLib = localDataLibrary()
    var localPlanetLibrary = [Planet]()
    //var localResidentLibrary = [Resident]()
    
    
    func getPlanets(completion:(result:Bool, planet: Planet)->())  {
        
        self.localDataLib.scanForPlanets({(success, planet) in

            completion(result: true, planet: planet)
            
            //return localDataLib.planets
        
        })
        
        
        
    }
    
    
    
    
    
    func getResidentsFrom(planet :Planet, completion: (success: Bool, residents: [Resident])->() ) {
        
        localDataLib.scanForResidents(planet, completion: {(success, residents) in
            
            if success {
                //print("iManager: \(residents)")
                completion(success: true, residents: residents)
            }
            else {
            
                completion(success: false, residents: [Resident()])
            }
            
            
        })
        
        
    }
    
    
    
    
    func getImageFrom(url:String, completion: (result: Bool, image: UIImage) -> ()) {
        
        var nm = NetworkingManager()
        nm.downloadImageFrom(url, completion: {(result, image) in
            
            completion(result:result, image: UIImage(data: image)!)
            })
        
        
    }
        
        
        
        
        
        
}