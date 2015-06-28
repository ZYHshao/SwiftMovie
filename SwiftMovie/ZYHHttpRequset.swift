//
//  ZYHHttpRequset.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

private var httpConnection:NSURLConnection?
class ZYHHttpRequset: NSObject,NSURLConnectionDataDelegate{
    var requestUrl:String?
    var downloadData:NSMutableData=NSMutableData()
    var isDownloadSuccess:Bool?
    var delegate:ZYHHttpRequestDelegate?
    class func requestFormUrl(url:NSString)->ZYHHttpRequset{
        var oldRequest:ZYHHttpRequset?=ZYHHttpRequestManager.sharedHttpRequestManager().requestForKey(url)
        if (oldRequest != nil){
            println("该任务存在")
            return oldRequest!
        }
        //新建下载任务
        var request:ZYHHttpRequset=ZYHHttpRequset()
        request.requestUrl=url
        request.startRequestUrl(url)
        ZYHHttpRequestManager.sharedHttpRequestManager().addTask(request, key: url)
        return request
    }
    
    func stop(){
        if httpConnection != nil {
            httpConnection?.cancel()
            httpConnection = nil
        }
    }
    
    //开始下载请求
    private func startRequestUrl(url:NSString){
        if httpConnection != nil {
            httpConnection!.cancel()
            httpConnection==nil
        }
        //创建连接对象
        var request=NSURLRequest(URL: NSURL(string: url)!)
        httpConnection=NSURLConnection(request: request, delegate: self)
        
    }
    //重写协议中的方法
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        downloadData.length=0
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        downloadData.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection) {
        isDownloadSuccess = true
        delegate!.ZYHHttpRequestSuccsee(self)
        ZYHHttpRequestManager.sharedHttpRequestManager().removeTaskFromUrl(self.requestUrl!)
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("加载失败")
        println(error)
        self.isDownloadSuccess=false
        ZYHHttpRequestManager.sharedHttpRequestManager().removeTaskFromUrl(self.requestUrl!)
    }
    
    
    
    
}
protocol ZYHHttpRequestDelegate{
    func ZYHHttpRequestSuccsee(request:ZYHHttpRequset)
}