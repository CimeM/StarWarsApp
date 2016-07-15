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
        
        //let planet = Planet()
        // TODO - update existing planets 
        //let networkingManager = NetworkingManager()
        
        return [loadSampleData()]
    }
    
    func loadSampleData() -> Planet {
        
        var planet = Planet()
        
        planet.climate = "sampleClimate"
        planet.created = "sampleCreated"
        planet.name = "sampleName"
        planet.diameter = "sampleDiameter"
        planet.gravity = "samplegravity"
        planet.image_url = "http://vignette2.wikia.nocookie.net/planetstar/images/e/eb/Forest_world.jpg"
        planet.likes = 23
        planet.population = "34"
        planet.residents = ["Obi One", "Kanobi", "Vader"]
        planet.surface_water = "yes"
        
        planet.details = ["name":"sampleName", "terrain":"sampleTerain"]
        
        return planet
        
    }
}