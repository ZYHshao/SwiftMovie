//
//  MOVIE2Viewontroller.swift
//  SwiftMovie
//
//  Created by apple on 15-6-28.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class MOVIE2Viewontroller: UIViewController {

    var Model:MovieModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.creatView()
        // Do any additional setup after loading the view.
    }

    func creatView(){
        var movieImage=UIImageView(frame: CGRectMake(10, 74, 68, 80))
        movieImage.setZYHWebImage(Model?.image, defaultImage: "img_90x90.png", isCache: true)
        self.view.addSubview(movieImage)
        var daoyanLabel=UILabel(frame: CGRectMake(100, 84, 200, 20))
        daoyanLabel.text=Model?.director
        self.view.addSubview(daoyanLabel)
        var yanyuanLabel=UILabel(frame: CGRectMake(100, 104, 200, 20))
        yanyuanLabel.text=Model?.actiors
        self.view.addSubview(yanyuanLabel)
        var shijianLabel=UILabel(frame: CGRectMake(100, 124, 200, 20))
        shijianLabel.text=Model?.pubdate
        self.view.addSubview(shijianLabel)
        var leixingLabel=UILabel(frame: CGRectMake(100, 144, 200, 20))
        leixingLabel.text=Model?.type
        self.view.addSubview(leixingLabel)
        var shichangLabel=UILabel(frame: CGRectMake(100, 164, 200, 20))
        shichangLabel.text=Model?.duration
        self.view.addSubview(shichangLabel)
        var button=UIButton(frame: CGRectMake(20, 174, 280, 25))
        button.backgroundColor=UIColor.orangeColor()
        button.setTitle("查看上映影院", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        self.view.addSubview(button)
        var neirongLabel=UILabel(frame: CGRectMake(10, 184, 300, 100))
        neirongLabel.text=Model?.abstract
        neirongLabel.numberOfLines=0
        self.view.addSubview(neirongLabel)
        var scroll=UIScrollView(frame: CGRectMake(0, 284, 320, 100))
        var arr:NSArray=NSArray()
        arr=(Model!.smallstills! as NSString).componentsSeparatedByString(",") as NSArray
        var a=arr.count
        scroll.contentSize=CGSizeMake(320, 100 + (CGFloat)(a/3 * 100))
        for var i:Int=0 ; i<a ; i++ {
           var image1=UIImageView(frame: CGRectMake((CGFloat)(40 + (i%3) * 80), (CGFloat)(10 + (i/3) * 100), 70, 90))
            
            image1.setZYHWebImage(arr[i] as? NSString, defaultImage: "img_90x90.png", isCache: true)
            scroll.addSubview(image1)
        }
        self.view.addSubview(scroll)
        
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
