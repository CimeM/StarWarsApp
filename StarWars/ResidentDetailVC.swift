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
        
        form +++ Section("Section1")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = "\(resident.name)"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = NSDate(timeIntervalSinceReferenceDate: 0)
        }
        
    }
    
    
}
