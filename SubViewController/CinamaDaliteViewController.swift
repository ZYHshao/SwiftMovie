//
//  CinamaDaliteViewController.swift
//  SwiftMovie
//
//  Created by apple on 15-6-26.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit
let CINAMADALITE_URL="http://m.api.tuan800.com/sub/movie21?cmd=GET_ONE_CINEMA&cinemaId=%d&image=ands1&userId=19492732&date=1386915559122"
class CinamaDaliteViewController: UITableViewController, ZYHHttpRequestDelegate{
    var id:NSNumber?
    var dataArray:NSMutableArray=NSMutableArray()
    var currentTasks:NSMutableDictionary=NSMutableDictionary()
    
    //MARK:delegate
    func beginDownload(){
        var url=NSString(format: CINAMADALITE_URL, id!.integerValue)
        var request:ZYHHttpRequset=ZYHHttpRequset.requestFormUrl(url)
        request.delegate=self
        currentTasks.setObject(request, forKey: CINAMADALITE_URL)
    }
    
    func ZYHHttpRequestSuccsee(request: ZYHHttpRequset) {
        var dict:NSDictionary=NSJSONSerialization.JSONObjectWithData(request.downloadData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var model:CinamaDaliteModel=CinamaDaliteModel()
        model.setValuesForKeysWithDictionary(dict)
        dataArray.addObject(model)
        self.creatHeadView()
        self.tableView.reloadData()
        
    }
    
    func creatHeadView(){
        var headView:UIView=UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 70))
        var label:UILabel=UILabel(frame: CGRectMake(5, 5, self.view.frame.size.width-10, 60))
        label.backgroundColor=UIColor.grayColor()
        var model:CinamaDaliteModel=dataArray[0] as CinamaDaliteModel
        label.text=model.address
        label.numberOfLines=0
        label.font=UIFont.systemFontOfSize(15)
        headView.addSubview(label)
        self.tableView.tableHeaderView=headView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beginDownload()
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
        if dataArray.count != 0 {
            var model:CinamaDaliteModel=dataArray[0] as CinamaDaliteModel
            return model.movies!.count
        }else{
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:CinamaDaliteCell?=tableView.dequeueReusableCellWithIdentifier("CinamaDaliteCell") as? CinamaDaliteCell
        if cell == nil {
            cell=NSBundle.mainBundle().loadNibNamed("CinamaDaliteCell", owner: self, options: nil).last as? CinamaDaliteCell
        }
        var model:CinamaDaliteModel=dataArray[0] as CinamaDaliteModel
        var dict:NSDictionary=model.movies![indexPath.row] as NSDictionary
        cell?.movieImage.setZYHWebImage(dict.objectForKey("image") as? NSString, defaultImage: "img_90x90.png", isCache: true)
        cell?.actorLabel.text=NSString(format: "主演:%@", dict.objectForKey("actors") as NSString)
        cell?.neirongLabel.text=NSString(format: "简介:%@", dict.objectForKey("abstract") as NSString)
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
