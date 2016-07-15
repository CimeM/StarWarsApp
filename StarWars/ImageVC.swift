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
        
        
        let exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        exitButton.setTitle("X", forState: .Normal)
        exitButton.addTarget(self, action: #selector(back), forControlEvents: .TouchUpInside)
        
        self.fulscreenImageView = UIImageView()
        self.fulscreenImageView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        self.view.addSubview(self.fulscreenImageView!)
        self.view.addSubview(exitButton)
        self.informationManager.getImageFrom(self.imageURL, completion:{(success, image) in
            
            self.fulscreenImageView!.image = image
            
        })
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func back(){
        
        self.performSegueWithIdentifier("unwindToPlanetInfoVC", sender: self)
        
    }
    
    
}
