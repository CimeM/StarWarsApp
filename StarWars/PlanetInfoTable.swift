//
//  PlanetInfoTable.swift
//  StarWars
//
//  Created by Martin Cimerman on 15/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import UIKit


/**
 
 Displays Initial View of the app - thumbnail image and planet information
 
 */

class PlanetInfoTable: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var imageView: UIImageView!
    
    var planetLibrary = PlanetaryLibrary()
    
    var showResidentsButtonRow = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        planetLibrary.scanForPlanets()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell") as UITableViewCell
        
        var planet = planetLibrary.planets[0]
        var keys = Array(planet.details.keys)
        
        if indexPath.row == showResidentsButtonRow {
            
                cell.textLabel?.text = "Show residents"
                cell.detailTextLabel?.text = "Number of Residents: N/A"
            
        }
        else {
                cell.textLabel?.text = keys[indexPath.row]
            
                cell.detailTextLabel?.text = planet.details[keys[indexPath.row]]
        }
        
        
        
        return cell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.planetLibrary.planets = planetLibrary.scanForPlanets()
        let planet = planetLibrary.planets[0]
        let count = (planet.details.count)
        
        print (count)
        return count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if showResidentsButtonRow == indexPath.row {
            
            performSegueWithIdentifier("planetRezidenceList", sender: self)
        }
    }
}
