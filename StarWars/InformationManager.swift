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
    
    
    /**
     
     retrieves planet form internet, can be extended to return an array of planets
     if network unreachable returns dummy data
     
     */
    
    func getPlanets(completion:(result:Bool, planet: Planet)->())  {
        
        self.localDataLib.scanForPlanets({(success, planet) in
            
            
            // if acqsition successful load the residents, otherwise load "no data" Planet
            if success{
                completion(result: true, planet: planet)
            }
            else {
                var dummyPlanet = Planet()
                dummyPlanet.selfDummyPopulation()
                completion(result: true, planet: dummyPlanet)
            }
            
            
        })
    }
    
    /**
     
     retrieves [Resident] form internet
     if network unreachable returns dummy data
     
     */
    
    
    func getResidentsFrom(planet :Planet, completion: (success: Bool, residents: [Resident])->() ) {
        
        localDataLib.scanForResidents(planet, completion: {(success, residents) in
            
            
            // if acqsition successful load the residents, otherwise load "no data" Resident
            if success {
                completion(success: true, residents: residents)
            }
            else {
                var dummyResident = Resident()
                dummyResident.selfDummyPopulation()
                completion(success: false, residents: [dummyResident])
            }
        })
    }
    
    
    /**
    
     retrieves data form internet
     if network unreachable returns dummy image "noimage"
     
     */
    
    func getImageFrom(url:String, completion: (result: Bool, image: UIImage) -> ()) {
        
        let nm = NetworkingManager()
        nm.downloadImageFrom(url, completion: {(result, image) in
            
            // if data is avalilable  load it, otherwise load the template image
            if result {
                    completion(result:result, image: UIImage(data: image!)!)
            }else {
                    completion(result:result, image: UIImage(named: "noimage")!)
            }
            
        })
    }
        
}