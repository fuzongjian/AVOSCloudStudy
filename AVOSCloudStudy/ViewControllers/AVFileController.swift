//
//  AVFileController.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit

class AVFileController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        saveFile()
        readFile()
        // Do any additional setup after loading the view.
    }
    // 保存文件
    func saveFile(){
        let data = NSData(contentsOfFile: (NSBundle.mainBundle().pathForResource("running_record", ofType: "json"))!)
        let file = AVFile(name: "running_record.json", data: data)
        file.saveInBackgroundWithBlock { (bool, error) -> Void in
            if bool{
                print(file.url)
            }else{
//                print(error)
            }
        }
    }
    // 读取文件 http://ac-rdrSVkCU.clouddn.com/M0raKWOYw8mljMgDNH6kE6D.json
    func readFile(){
        let file = AVFile(URL: "http://ac-rdrSVkCU.clouddn.com/M0raKWOYw8mljMgDNH6kE6D.json")
        file.getDataInBackgroundWithBlock({ (data, error) -> Void in
            print(data)
            }) { (percentDone) -> Void in// 下载进度
                print(percentDone)
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
