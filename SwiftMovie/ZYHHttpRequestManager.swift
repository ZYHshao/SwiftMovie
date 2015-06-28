//
//  ZYHHttpRequestManager.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit
private let manager = ZYHHttpRequestManager()
class ZYHHttpRequestManager: NSObject {
    var taskDick:NSMutableDictionary?
    class func sharedHttpRequestManager()->ZYHHttpRequestManager{
        return manager
    }
    
    func addTask(request:ZYHHttpRequset, key:NSString?){
        if (key != nil){
            taskDick?.setObject(request, forKey: key!)
        }
    }
    //查看是否存在任务
    func requestForKey(key:NSString)->ZYHHttpRequset?{
        return taskDick?.objectForKey(key) as? ZYHHttpRequset
    }
    //删除指定任务
    func removeTaskFromUrl(url:NSString){
        taskDick?.removeObjectForKey(url)
    }
    //停止下载任务
    func stopAllTask(dict:NSDictionary){
        for (request,url) in dict {
            request.stop()
            taskDick?.removeObjectForKey(url)
        }
    }
    
    
    
    override init() {
       super.init()
       taskDick=NSMutableDictionary()
    }
}
