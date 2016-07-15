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

class informationManager {
    
    let localPlanetaryLibrary = PlanetaryLibrary()
    
    func getPlanets() -> PlanetaryLibrary {
        
        self.localPlanetaryLibrary.scanForPlanets()
        
        return self.localPlanetaryLibrary
    }
}