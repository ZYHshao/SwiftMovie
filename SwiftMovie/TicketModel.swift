//
//  TicketModel.swift
//  SwiftMovie
//
//  Created by apple on 15-6-23.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class TicketModel: NSObject {
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        return
    }
    
    var id:NSString?
    var type:NSNumber?
    var title:NSString?
    var siteType:NSString?
    var image:NSString?
    var price:NSNumber?
    var from:NSString?
    var extInfo:NSString?
    var discount:NSNumber?
    var dealUrl:NSString?
    var note:NSString?
    var sell:NSNumber?
    var url:NSString?
    var expire:NSString?
    var priceOri:NSNumber?
    var remain:NSNumber?
}
