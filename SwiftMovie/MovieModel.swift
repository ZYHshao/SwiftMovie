//
//  MovieModel.swift
//  SwiftMovie
//
//  Created by apple on 15-6-24.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class MovieModel: NSObject {
    var id:NSString?
    var priority:NSNumber?
    var type:NSString?
    var abstract:NSString?
    var duration:NSString?
    var title:NSString?
    var image:NSString?
    var rating:NSString?
    var actiors:NSString?
    var pubdate:NSString?
    var director:NSString?
    var popularity:NSNumber?
    var iscoming:NSNumber?
    var totalcinemas:NSNumber?
    var bigstills:NSString?
    var videourl:NSString?
    var smallstills:NSString?
    var smallimage:NSString?
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        return
    }
}
