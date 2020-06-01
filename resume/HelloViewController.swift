//
//  HellViewController.swift
//  resume
//
//  Created by Bober on 01/06/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {
    
    
    @IBOutlet weak var helloLabel: UILabel!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = self.username else {return}
        helloLabel.text = "Welcome, "  + username
    }
  

}
