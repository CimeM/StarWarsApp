//
//  ResidentsList.swift
//  StarWars
//
//  Created by Martin Cimerman on 15/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import UIKit

class ResidentsList: UIViewController , UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var residentsTableView: UITableView!
    
    var selectedPlanet: Planet?
    
    var infromationManager = InformationManager()
    
    var residents = [Resident]()
    
    var selectedResident = Resident()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        residentsTableView.delegate = self
        residentsTableView.dataSource = self
        
        self.residents = infromationManager.getResidentsFrom(self.selectedPlanet!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell") as UITableViewCell
        
        
        
        let resident = self.residents[indexPath.row]
        
        cell.textLabel?.text = resident.name
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.residents.count
        return count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
            self.selectedResident = self.residents[indexPath.row]
            toResidentDetail()

    }
    
    func toResidentDetail() {
        performSegueWithIdentifier("showRezidentDetail", sender: self)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showRezidentDetail") {
            let destinationVC = segue.destinationViewController as! ResidentDetailVC
            
            destinationVC.resident = self.selectedResident
        }
    }
    
}
