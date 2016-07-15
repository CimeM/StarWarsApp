//
//  informationManager.swift
//  StarWars
//
//  Created by Martin Cimerman on 14/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import Foundation

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
    
    func getResidentsFrom(planet :Planet) -> [Resident]{
        
        localDataLib.scanForResidents(planet, completion: {(success, residents) in
            
            
            
            })
        
        return localDataLib.residents
    }
}