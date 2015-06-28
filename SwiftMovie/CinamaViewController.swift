//
//  CinamaViewController.swift
//  SwiftMovie
//
//  Created by wutong on 15/6/12.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit
let Cinama_URL="http://m.api.tuan800.com/sub/movie21?cmd=GET_DEAL_CINEMAS&lat=40.035794&lng=116.350872&date=1385883214127&cityId=1&page=1&pageset=10"
class CinamaViewController: UITableViewController,ZYHHttpRequestDelegate {
    var dataArr:NSMutableArray=NSMutableArray()
    var currectTask:NSMutableDictionary=NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //self.edgesForExtendedLayout=UIRectEdge.None
        self.beginDownload()
    }
    
    func beginDownload(){
        var request=ZYHHttpRequset.requestFormUrl(Cinama_URL)
        request.delegate=self
        currectTask.setObject(request, forKey: Cinama_URL)
    }
    
    //回调方法
    func ZYHHttpRequestSuccsee(request: ZYHHttpRequset) {
        var arr:NSArray=NSJSONSerialization.JSONObjectWithData(request.downloadData, options: NSJSONReadingOptions.MutableContainers, error:NSErrorPointer.null()) as  NSArray
        for dict in arr {
            var model:CinamaModel=CinamaModel()
            model.setValuesForKeysWithDictionary(dict as NSDictionary)
            dataArr.addObject(model)
            
        }
        self.tableView.reloadData()
    }
   
   //选中cell的方法
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var con=CinamaDaliteViewController()
        con.hidesBottomBarWhenPushed=true
        var model:CinamaModel=dataArr[indexPath.row] as CinamaModel
        con.id=model.id
        self.navigationController?.pushViewController(con, animated: true)
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
        return dataArr.count
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:CinamaCell? = tableView.dequeueReusableCellWithIdentifier("CinamaCell") as? CinamaCell
        
        if cell==nil {
            cell=NSBundle.mainBundle().loadNibNamed("CinamaCell", owner: self, options: nil).last as? CinamaCell
            
        }
        var model:CinamaModel = dataArr[indexPath.row] as CinamaModel
        cell?.showCell(model as CinamaModel)
        cell?.selectionStyle=UITableViewCellSelectionStyle.None 

        return cell!
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
