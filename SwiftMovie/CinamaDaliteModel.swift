//
//  CinamaDaliteModel.swift
//  SwiftMovie
//
//  Created by apple on 15-6-26.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class CinamaDaliteModel: NSObject {
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    var address:NSString?
    var id:NSNumber?
    var dealInfo:NSArray?
    var title:NSString?
    var guide:NSString?
    var tel:NSString?
    var distance:NSNumber?
    var lat:NSNumber?
    var lng:NSNumber?
    var is_seating:NSNumber?
    var remain_shows:NSNumber?
    var is_favorite:Bool?
    var movies:NSArray?
    
}
