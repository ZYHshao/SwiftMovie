//
//  StarView.swift
//  SwiftMovie
//
//  Created by apple on 15-6-24.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class StarView: UIView {

    var backImage:UIImageView?
    var foreImage:UIImageView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.creatView()
    }
    func creatView(){
        backImage=UIImageView(frame: CGRectMake(0, 0, 65, 23))
        backImage?.image=UIImage(named: "StarsBackground.png")
        foreImage=UIImageView(frame: CGRectMake(0, 0, 65, 23))
        foreImage?.image=UIImage(named: "StarsForeground")
        backImage?.contentMode=UIViewContentMode.Left
        foreImage?.contentMode=UIViewContentMode.Left
        foreImage?.clipsToBounds=true
        self.addSubview(backImage!)
        self.addSubview(foreImage!)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.creatView()
    }
    func setStarLevel(level:CGFloat){
        foreImage?.frame=CGRectMake(0, 0, (backImage?.frame.size.width)! * (level/0.5), 23)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
