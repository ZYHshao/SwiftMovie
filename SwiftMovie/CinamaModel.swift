//
//  CinamaModel.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class CinamaModel: NSObject {
    var address:NSString?
    var id:NSNumber?
    var dealInfo:NSArray?
    var title:NSString?
    var guide:NSString?
    var tel:NSString?
    var distance:NSNumber?
    var lat:NSNumber?
    var lng:NSNumber?
    var is_favorite:Bool?
    var is_seating:NSNumber?
    var remain_shows:NSNumber?
    var isbuy:NSNumber?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        return
    }
}
