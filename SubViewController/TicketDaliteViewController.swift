//
//  TicketDaliteViewController.swift
//  SwiftMovie
//
//  Created by apple on 15-6-28.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit

class TicketDaliteViewController: UITableViewController {

    var Model:TicketModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 900
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier("ti") as? UITableViewCell
        var image1:UIImageView?
        var title:UILabel?
        var price:UILabel?
        var oriPrice:UILabel?
        var time:UILabel?
        var button:UIButton?
        var lastLabel:UILabel?
        if  cell == nil {
            cell=UITableViewCell(frame: CGRectMake(0, 0, self.view.frame.size.width, 800))
            image1=UIImageView(frame: CGRectMake(10, 10, 300, 200))
            cell?.contentView.addSubview(image1!)
            title=UILabel(frame: CGRectMake(10, 210, 300, 20))
            cell?.contentView.addSubview(title!)
            price=UILabel(frame: CGRectMake(10, 230, 60, 15))
            price?.textColor=UIColor.orangeColor()
            cell?.contentView.addSubview(price!)
            oriPrice=UILabel(frame: CGRectMake(100, 235, 200, 20))
            oriPrice?.font=UIFont.systemFontOfSize(14)
            cell?.contentView.addSubview(oriPrice!)
            time=UILabel(frame: CGRectMake(20, 255, 150, 30))
            time?.textColor=UIColor.redColor()
            cell?.contentView.addSubview(time!)
            button=UIButton(frame: CGRectMake(20, 290, 280, 25))
            button?.backgroundColor=UIColor.orangeColor()
            button?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Highlighted)
            cell?.contentView.addSubview(button!)
            lastLabel=UILabel(frame: CGRectMake(10, 300, 300, 500))
            lastLabel?.numberOfLines=0
            cell?.contentView.addSubview(lastLabel!)
        }
        image1?.setZYHWebImage(Model?.image, defaultImage: "img_90x90.png", isCache: true)
        title?.text=Model?.title
        price?.text=NSString(format: "￥%d元", (Model!.price!.integerValue)/100)
        oriPrice?.text=NSString(format: "原价:%d %.2f折", Model!.price!.integerValue/100,(Model!.price!.floatValue/10)/(Model!.priceOri!.floatValue/100))
        time?.text=NSString(format: "有效期:%@", Model!.expire!)
        button?.setTitle("立即购买", forState: UIControlState.Normal)
        lastLabel?.text=Model?.extInfo
        return cell!
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
