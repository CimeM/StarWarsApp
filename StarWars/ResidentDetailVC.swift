//
//  UserDetailVC.swift
//  StarWars
//
//  Created by Martin Cimerman on 15/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import UIKit
import Eureka

class ResidentDetailVC: FormViewController {

    
    var resident = Resident()
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = resident.details["name"]
        
        
        form +++ Section("Resident Detais")
        for value in resident.values {
                form.last!<<<TextRow(){ row in
                    row.title = value
                    row.placeholder = resident.details[value]
                }
        }
        
        
    }
    
    
}
