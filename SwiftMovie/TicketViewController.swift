//
//  TicketViewController.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit
let TICKET_URL="http://m.api.tuan800.com/sub/movie21?cmd=GET_DEAL_LIST&cityId=1&format=BRIEF&page=1&pageset=10"
class TicketViewController: UITableViewController,ZYHHttpRequestDelegate {

    var dataArray:NSMutableArray=NSMutableArray()
    var currentTask:NSMutableDictionary=NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.beginDownload()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func beginDownload(){
        var request=ZYHHttpRequset.requestFormUrl(TICKET_URL)
        request.delegate=self;
        currentTask.setObject(request, forKey: TICKET_URL)
    }
    //下载完成后的回调
    func ZYHHttpRequestSuccsee(request: ZYHHttpRequset) {
        var arr: NSArray?=NSJSONSerialization.JSONObjectWithData(request.downloadData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSArray
        for dict in arr! {
            var model:TicketModel=TicketModel()
            model.setValuesForKeysWithDictionary(dict as NSDictionary)
            dataArray.addObject(model)
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return dataArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:TicketCell?=tableView.dequeueReusableCellWithIdentifier("TicketCell") as? TicketCell
        if cell==nil {
            cell=NSBundle.mainBundle().loadNibNamed("TicketCell", owner: self, options: nil).last as? TicketCell
        }
        var model:TicketModel=dataArray[indexPath.row] as TicketModel
        cell?.showCell(model)

        // Configure the cell...
        cell?.selectionStyle=UITableViewCellSelectionStyle.None
        

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cov:TicketDaliteViewController=TicketDaliteViewController()
        var model:TicketModel=dataArray[indexPath.row] as TicketModel
        cov.Model=model
        self.navigationController?.pushViewController(cov, animated: true)
    }

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
