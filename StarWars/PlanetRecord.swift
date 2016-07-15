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
    var name            = ""
    var terrain         = ""
    var climate         = ""
    var population      = ""
    var gravity         = ""
    var surface_water   = ""
    var diameter        = ""
    var edited          = ""
    var orbital_period  = ""
    var created         = ""
    var rotation_period = ""
    var image_url       = ""
    var likes           = 0
    var residents       = [String]()
}