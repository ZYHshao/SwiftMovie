//
//  TabBarController.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit


class TabBarController: UITabBarController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        var controllerArray:NSMutableArray=NSMutableArray()
        var navCArray:NSMutableArray=NSMutableArray()
        // Do any additional setup after loading the view.
        let titleArray:NSArray=["影院","电影票","电影","我"];
        let imageArray:NSArray=["6","5","3","4"]
        var controller1=CinamaViewController()
        var controller2=TicketViewController()
        var controller3=MovieViewController()
        var controller4=MyViewController()
        controllerArray.addObject(controller1)
        controllerArray.addObject(controller2)
        controllerArray.addObject(controller3)
        controllerArray.addObject(controller4)
        for var i=0 ; i<4 ; i++ {
            (controllerArray[i] as UIViewController).title=titleArray[i] as? String
            var navC=UINavigationController(rootViewController: controllerArray[i] as UIViewController)
            //navC.navigationBar.backgroundColor=UIColor.whiteColor()
            navCArray.addObject(navC)
            navC.navigationBar.setBackgroundImage(UIImage(named: "pic_recharge_btn_orange.png"), forBarMetrics: UIBarMetrics.Default)
            navC.tabBarItem.image=UIImage(named: imageArray[i] as String)
            }
        self.tabBar.backgroundImage=UIImage(named: "pic_recharge_btn_orange副本")
        self.viewControllers=navCArray
        
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
