//
//  MovieCell.swift
//  SwiftMovie
//
//  Created by apple on 15-6-24.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var starView: StarView!
    @IBOutlet weak var zhekouLabel: UILabel!
    @IBOutlet weak var changciLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pingfenLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func showCell(model:MovieModel){
        self.movieImage.setZYHWebImage(model.image, defaultImage: "img_90x90.png", isCache: true)
        titleLabel.text=model.title
        starView.setStarLevel((CGFloat)(model.rating!.floatValue)/10*5)
        var changci:NSString=NSString(format: "%d家正在上映%d场", arc4random()%100,arc4random()%1000)
        changciLabel.text=changci
        pingfenLabel.text=NSString(format: "%.2f", model.rating!.floatValue)
        zhekouLabel.text="￥19.5"
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
