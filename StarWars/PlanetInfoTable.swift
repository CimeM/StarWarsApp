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
    
    var planetLibrary = localDataLibrary()
    
    //var planet = Planet()
    
    var planets = [Planet()]
    
    var showResidentsButtonRow = 1
    
    var informationManager = InformationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        informationManager.getPlanets( {(result, planet) in
            self.planets = [planet]
            self.tableView.reloadData()
            
            print(planet.likes)
        })
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell") as UITableViewCell
        

        
        
        if indexPath.row == showResidentsButtonRow {
            
                cell.textLabel?.text = "Show residents >"
                cell.detailTextLabel?.text = "Known residents: \(self.planets[0].residents.count)"
            
        }
        else if (self.planets[0].values[indexPath.row] == "likes") {
            cell.textLabel?.text = (self.planets[0].values[indexPath.row])
            
            cell.detailTextLabel?.text = "\(self.planets[0].likes)"
            
        }
        else if (self.planets[0].values[indexPath.row] == "residents") {
            cell.textLabel?.text = (self.planets[0].values[indexPath.row])
            
            cell.detailTextLabel?.text = "\(self.planets[0].residents.count)"
            
        }
        else {
            
                cell.textLabel?.text = (self.planets[0].values[indexPath.row])
            
                cell.detailTextLabel?.text = self.planets[0].details[self.planets[0].values[indexPath.row]]
        }
        
        
        
        return cell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //self.planetLibrary.planets = planetLibrary.scanForPlanets()
        //let planet = self.planets.count
        
        let planet = Planet()
        let count = (planet.values.count)
        
        
        return count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if showResidentsButtonRow == indexPath.row {
            
            toRezidentList()
        }
    }
    
    func toRezidentList() {
        
        performSegueWithIdentifier("planetRezidenceList", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "planetRezidenceList") {
            
            let destinationVC = segue.destinationViewController as! ResidentsList
            
            destinationVC.selectedPlanet = self.planetLibrary.planets[0]
            
        }
    }
}
