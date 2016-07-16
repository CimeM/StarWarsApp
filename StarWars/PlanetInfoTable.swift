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
    
    @IBAction func unwindToPlanetInfoVC(sender: UIStoryboardSegue) {
        
    }
    
    weak var activityIndicatorView: UIActivityIndicatorView!
    weak var imageActivityIndicatorView: UIActivityIndicatorView!
    
    /**
     
     local data array of planets - can be updated with InformationManager
     
     */
    var planets = [Planet()]
    
    var informationManager = InformationManager()
    
    /**
     
     residents list button position (in table view)
     
     */
    var showResidentsButtonRow = 1
    
    /**
     
     user can like the planet only once
     
     */
    var pandoraLike = false
    
    /**
     
     is loading - true, finished loading - false
     
     */
    var loadingFlag = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // load aditional view styles
        loadStyles()
        
        
        // table data activity indicator
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        tableView.backgroundView = activityIndicatorView
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.activityIndicatorView = activityIndicatorView
        
        
        // image data activity indicator
        let imageActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        self.imageView.backgroundColor = UIColor.lightGrayColor()
        imageActivityIndicatorView.frame.origin = imageView.frame.origin
        self.imageActivityIndicatorView  = imageActivityIndicatorView
        self.imageView.addSubview(imageActivityIndicatorView)
        
        
        // enable tap gesture on image
        self.imageView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(PlanetInfoTable.imageTapped(_:)))
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        // perform planetary information retrival
        loadPlanetaryInformation()
        
    }
    
    /**
     
     Loads planetary information and refreshes visual elements on success or faliure
     
     */
    
    func loadPlanetaryInformation() {
        
        self.informationManager.getPlanets( {(result, planet) in
            self.planets = [planet]
            self.tableView.reloadData()
            
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            let imageUrl =  planet.details["image_url"]!
            self.activityIndicatorView.stopAnimating()
            
            // depending on the result display the data
            if result {
                self.title = "Planet " + self.planets[0].details["name"]! + " info"
                self.loadingFlag = false
            }
            else {
                self.title = "Data unavailable"
            }
            
            
            
            // download thumbnail image
            self.informationManager.getImageFrom(imageUrl, completion:{(success, image) in
                
                self.imageView.image = image
                self.view.backgroundColor = UIColor(patternImage: image)
                self.imageActivityIndicatorView.stopAnimating()
                
                self.tableView.backgroundColor = UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0)
                
                
            })
        })
        
    }
    
    /**
     
     when user clicks the tumbnail image perform the segue
     */
    
    func imageTapped(img: AnyObject)
    {
        toFullscreenImage()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.activityIndicatorView.startAnimating()
        self.imageActivityIndicatorView.startAnimating()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell") as UITableViewCell
        
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        // render table buttons differently
        if indexPath.row == showResidentsButtonRow {
            
                cell.textLabel?.text = "residents"
                cell.accessoryView = UIImageView(image: UIImage(named: "open_arrow"))
                cell.detailTextLabel?.text = "Known residents: \(self.planets[0].residents.count)"
            
        }
        else if (self.planets[0].values[indexPath.row] == "likes") {
            cell.textLabel?.text = "likes"
            cell.accessoryView = UIImageView(image: UIImage(named: "like_icon"))
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
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if !loadingFlag {
            if showResidentsButtonRow == indexPath.row {
                
                toRezidentList()
            }
            
            // likes button if clicked - increase likes
            if cell?.textLabel?.text == "likes" {
                
                if !pandoraLike {
                    
                    self.planets[0].likes += 1
                    cell?.detailTextLabel?.text = "\(self.planets[0].likes)"
                    
                    // once you liked it, there is no way back!
                    self.pandoraLike = true
                
                }
            }
        }
        else {
            //reloads local data
            self.loadPlanetaryInformation()
        }
        
        
    }
    
    
    func toRezidentList() {
        
        performSegueWithIdentifier("planetRezidenceList", sender: self)
        
    }
    func toFullscreenImage() {
        
        performSegueWithIdentifier("shofImageFullscreen", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "planetRezidenceList") {
            
            let destinationVC = segue.destinationViewController as! ResidentsList
            
            destinationVC.selectedPlanet = self.planets[0]
            
        }
        
        if (segue.identifier == "shofImageFullscreen") {
            
            let destinationVC = segue.destinationViewController as! ImageVC
            
            destinationVC.imageURL = self.planets[0].details["image_url"]!
                        
        }
    }
    
    func loadStyles() {
        
        //blur effect for views' background image
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        self.view.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(blurEffectView)
        self.view.sendSubviewToBack(blurEffectView)
    }
    

}
