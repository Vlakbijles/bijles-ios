//
//  ProfileViewController.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 08/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTitle: UILabel!
    @IBOutlet weak var profileText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Circular image
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2;
        profileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
