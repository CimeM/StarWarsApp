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

struct localDataLibrary {
    
    var onePlanet = Planet()
    var planets = [Planet()]
    var residents = [Resident()]    
    var planetsResourceURL = "https://private-anon-648f3e5aab-starwars2.apiary-mock.com/planets/10"
    // when initialized the library populates itself with planets
    init() {
        //self.scanForPlanets()
    }
    
    
    /**
     
     using network manager, JSON data is being recieved and parsed
     completion handler passes the data to the caller
     
     */
    
    mutating func scanForPlanets( completion: (success: Bool, planet : Planet) ->()) {
        
        if self.planets[0].details.isEmpty  {
            
            let nm = NetworkingManager()
            nm.getdatafromURL(planetsResourceURL, completion: { (success, json) -> () in
                
                var planet = Planet()
                if success  {
                    planet = nm.parsePlanetData(json!)
                    completion(success: true, planet: planet)
                    
                }
                else{
                    completion(success: false, planet: Planet())
                    
                }
                self.planets = [planet]//loadSampleData()
                
            })
        }
    }
    
    /**
     
     using networking manager JSON data is retrieved
     later, data is parsed using parseResidentData
     
     */
    
    mutating func scanForResidents(planet: Planet, completion: (success: Bool, residents : [Resident]) ->()) {
        
        if self.residents[0].details.isEmpty  {
            
            let nm = NetworkingManager()
            
            // for loop going trough all the residents
            for index in 0...planet.residents.count-1 {
                
                let residentUrl = planet.residents[index]
                // replacing http with https - shortcut - to be avoided
                let url = residentUrl.stringByReplacingOccurrencesOfString("http", withString: "https")
                nm.getdatafromURL(url, completion: { (success, json) -> () in
                    
                    var resident = Resident()
                    resident = nm.parseResidentData(json!)
                
                    self.addToResidents(resident)
                    
                    
                    if (self.residents.count == planet.residents.count) {
                        completion(success: true, residents : self.residents)
                    }
                })
            }
        }
    }
    
    mutating func addToResidents(resident: Resident) {
        
        self.residents.append(resident)
        
    }
    
    
}