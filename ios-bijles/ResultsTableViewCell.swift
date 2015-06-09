//
//  ResultsTableViewCell.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 07/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultDescription: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
