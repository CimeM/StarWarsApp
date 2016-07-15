//
//  PlanetRecord.swift
//  StarWars
//
//  Created by Martin Cimerman on 14/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import Foundation


/**
 
 Planet information structure
 
 */

struct Planet {
    var likes           = 0
    var residents       = [String]()
    
    var values = ["name","terrain","climate","population", "gravity", "surface_water", "diameter", "edited", "orbital_period", "created", "rotation_period", "image_url", "likes", "residents"]
    
    var details = [String: String]()
}