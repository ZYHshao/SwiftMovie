//
//  MyViewController.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.creatView()
        // Do any additional setup after loading the view.
    }
    
    func creatView(){
        var label1:UILabel=UILabel(frame: CGRectMake(5, 70, 200, 20))
        label1.text="用户:未登录"
        self.view.addSubview(label1)
        var label2:UILabel=UILabel(frame: CGRectMake(5, 100, 200, 20))
        label2.text="客服电话：400-159-9800"
        self.view.addSubview(label2)
        var button:UIButton=UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame=CGRectMake(250, 70, 60, 30)
        button.setTitle("登陆", forState: UIControlState.Normal)
        button.backgroundColor=UIColor.orangeColor()
        self.view.addSubview(button)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
