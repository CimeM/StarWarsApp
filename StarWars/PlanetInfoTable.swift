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

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell") as UITableViewCell
        
        cell.textLabel?.text = "ewr"
        
        return cell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
}
