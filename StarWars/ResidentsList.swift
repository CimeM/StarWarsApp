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
    weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    
    var selectedPlanet: Planet? {
        didSet {
            //print(self.selectedPlanet)
        }
        
    }
    
    var infromationManager = InformationManager()
    
    var residents = [Resident]()
    
    var selectedResident = Resident()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        residentsTableView.delegate = self
        residentsTableView.dataSource = self
        
        //activity indication
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        residentsTableView.backgroundView = activityIndicatorView
        residentsTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.activityIndicatorView = activityIndicatorView
        
        

        infromationManager.getResidentsFrom(self.selectedPlanet!, completion: {(success,residents) in
            
            
                //print("list: \(residents)")
                self.residents = residents
                self.residentsTableView.reloadData()
                self.activityIndicatorView.stopAnimating()
                self.residentsTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            
            })
        
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
    
        activityIndicatorView.startAnimating()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell") as UITableViewCell
        
        
        
        //let resident = self.residents[indexPath.row]
        
        cell.textLabel?.text = "name"
        cell.detailTextLabel?.text = self.residents[indexPath.row].details["name"]
        
        
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
            print("selected resdent: \(self.residents[indexPath.row].details["name"])")
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
