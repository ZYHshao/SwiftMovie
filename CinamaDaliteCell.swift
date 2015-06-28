//
//  CinamaDaliteCell.swift
//  SwiftMovie
//
//  Created by apple on 15-6-26.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class CinamaDaliteCell: UITableViewCell {
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var neirongLabel: UILabel!

    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
