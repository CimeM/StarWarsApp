//
//  PlanetLibrary.swift
//  StarWars
//
//  Created by Martin Cimerman on 14/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import Foundation


/**
 
 Library where different planets are stored.
 it has a function to scan for planets
 
 */

struct PlanetaryLibrary {
    
    var planets = [Planet]()
    
    
    // when initialized the library populates itself with planets
    init() {
        
        self.scanForPlanets()
        
    }
    
    // retrieves data from network and updates itself
    func scanForPlanets() -> [Planet] {
        
        let planet = Planet()
        // TODO - update existing planets 
        let networkingManager = NetworkingManager()
        
        
        return [planet]
    }
}