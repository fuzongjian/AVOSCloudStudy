//
//  RootViewController.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView   :UITableView?
    var MainItems   :NSArray?
    var SubItems    :NSArray?
    let cellID = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        MainItems = ["AVObject","查询","用户","文件","Pointer"]
        SubItems = ["基本AVObject用法，增删改查","AVQuery基本用法","用户基本操作","AVFile文件基本操作","Pointer一对一，一对多关系建模"]
        
        tableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),style:.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.registerNib(UINib.init(nibName: "RootCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView?.tableFooterView = UIView()
        self.view.addSubview(tableView!)
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (MainItems?.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:RootCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! RootCell
        cell.mainTitleLable.text = MainItems![indexPath.row] as? String
        cell.subTitleLable.text = SubItems![indexPath.row] as? String
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let foundation = chooseController(indexPath.row)
        foundation.title = MainItems?.objectAtIndex(indexPath.row) as? String
        navigationController?.pushViewController(foundation, animated: true)
    }
    func chooseController (integer: NSInteger) -> UIViewController{
        if integer == 0{
            return AVObjectController()
        }else if integer == 1{
            return AVQueryController()
        }else if integer == 2{
            return UserController()
        }else if integer == 3{
            return AVFileController()
        }else{
            return PointerController()
        }
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
