//
//  ResidentRecord.swift
//  StarWars
//
//  Created by Martin Cimerman on 15/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import Foundation

struct Resident {
    
    var name = ""
    var height  = ""
    
    var values = ["name","height","mass","hair_color", "skin_color", "eye_color", "birth_year", "gender", "homeworld", "created", "edited", "image_url"]
    
    var details = [String: String]()
    
}