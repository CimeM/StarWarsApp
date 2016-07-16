//
//  ImageVC.swift
//  StarWars
//
//  Created by Martin Cimerman on 15/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {

    
    @IBOutlet var fulscreenImageView : UIImageView?
    
    var informationManager = InformationManager()
    
    var imageURL = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        // close button
        let exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        exitButton.setTitle("X", forState: .Normal)
        exitButton.addTarget(self, action: #selector(back), forControlEvents: .TouchUpInside)
        
        
        self.fulscreenImageView = UIImageView()
        
        
        
        self.view.addSubview(self.fulscreenImageView!)
        self.view.addSubview(exitButton)
        
        // perform image request
        self.informationManager.getImageFrom(self.imageURL, completion:{(success, image) in
            
            // load the image when finished
            self.fulscreenImageView!.image = image
            
        })
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // centerin the image
        self.fulscreenImageView?.frame = CGRect(x: 0,
                                                y: (self.view.frame.height/2) - (self.view.frame.width/2) ,
                                                width: self.view.frame.width,
                                                height: self.view.frame.width)
    }
    
    func back(){
        
        self.performSegueWithIdentifier("unwindToPlanetInfoVC", sender: self)
        
    }
    
    
}
