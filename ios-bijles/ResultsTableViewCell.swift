//
//  ResultsTableViewCell.swift
//  ios-bijles
//
//  Created by Tycho van der Ouderaa on 07/06/15.
//  Copyright (c) 2015 Suftwear. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
