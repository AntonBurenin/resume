//
//  DescriptionViewController.swift
//  resume
//
//  Created by Bober on 01/06/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillLabels(username: bober)
    }
    
    private func fillLabels(username: UserInfo) {
        nameLabel.text = username.name
        surnameLabel.text = username.surname
        ageLabel.text = String(username.age)
        cityLabel.text = username.city
    }
}
