//
//  HeroTableViewCell.swift
//  EjemploTabla
//
//  Created by Mauricio Vasquez on 4/24/15.
//  Copyright (c) 2015 Mauricio Vasquez. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    @IBOutlet var heroImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
