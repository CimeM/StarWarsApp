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
    
    var selectedPlanet: Planet?
    
    var infromationManager = InformationManager()
    
    var residents = [Resident]()
    
    var selectedResident = Resident()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        residentsTableView.delegate = self
        residentsTableView.dataSource = self
        
        
        self.title = "Resident List(\(self.selectedPlanet!.residents.count))"
        
        
        //activity indication
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        
        residentsTableView.backgroundView = activityIndicatorView
        residentsTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.activityIndicatorView = activityIndicatorView
        
        

        infromationManager.getResidentsFrom(self.selectedPlanet!, completion: {(success,residents) in
            

                self.residents = residents
                self.residents.removeFirst()
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
        
        cell.textLabel?.text = self.residents[indexPath.row].details["name"]
        cell.detailTextLabel!.text = "Resident gender: " + self.residents[indexPath.row].details["gender"]!
        cell.accessoryView = UIImageView(image: UIImage(named: "open_arrow"))
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.residents.count
        return count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
