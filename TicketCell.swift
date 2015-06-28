//
//  TicketCell.swift
//  SwiftMovie
//
//  Created by apple on 15-6-23.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell {
    @IBAction func buyButton(sender: UIButton) {
    }

    @IBOutlet weak var InfoImage: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var zhekouLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func showCell(model:TicketModel){
        self.InfoImage.setZYHWebImage(model.image, defaultImage:"img_90x90.png", isCache: true)
        titleLabel.text=model.title
        var price:NSString=NSString(format: "%d", (model.price?.intValue)!/100)
        priceLabel.text=price
        var zhekou:NSString=NSString(format: "￥%d %.2f折", (model.priceOri!.intValue)/100,(model.price!.floatValue/100)/(model.priceOri!.floatValue/100))
        zhekouLabel.text=zhekou
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
