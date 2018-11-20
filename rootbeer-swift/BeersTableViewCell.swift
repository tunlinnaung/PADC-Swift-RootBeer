//
//  BeersTableViewCell.swift
//  rootbeer-swift
//
//  Created by eidoshack on 11/20/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class BeersTableViewCell: UITableViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
