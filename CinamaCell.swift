//
//  CinamaCell.swift
//  SwiftMovie
//
//  Created by apple on 15-6-22.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class CinamaCell: UITableViewCell {
    func showCell(model:CinamaModel){
        titleLabel.text=model.title
        var distance=(model.distance?.floatValue)!/1000
        disttanceLabel.text=NSString(format: "%.3fkm", distance)
        var price=NSString(format: "￥%d起", (model.dealInfo![0].objectForKey("price") as Int)/100)
        priceLabel.text=price
        priceLabel.textColor=UIColor.orangeColor()
        var tape=NSString(format: "%d种优惠电影票", model.dealInfo!.count)
        tpyeLabel.text=tape
    }
    
    
    @IBOutlet weak var disttanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var tpyeLabel: UILabel!
    @IBOutlet weak var zanLabel: UILabel!
    @IBAction func zanButton(sender: UIButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
