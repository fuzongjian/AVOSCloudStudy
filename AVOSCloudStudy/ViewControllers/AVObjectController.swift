//
//  AVObjectController.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//
//var name: String?
//var age : Int32?
//var hobby: String?
//var saying: String?
import UIKit

class AVObjectController: SuperViewController {
    var nameArr: Array<String>?
    var ageArr: Array<Int>?
    var hobbyArr: Array<String>?
    var sayingArr: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameArr = ["周杰伦","齐秦","罗大佑","王力宏","古巨基"]
        ageArr = [12,34,43,23,37]
        hobbyArr = ["健身","散打","跑步","乒乓球","羽毛球"]
        sayingArr = ["no pains no gains","梅花香自苦寒来","好好学习，天天向上","少壮不努力","老大徒伤悲"]
//        createFolder()
//        getObjectId()
//        getObjectProperty()
        createManyPerosn()
    }
    
    // 循环创建对象，并保存对象
    func createManyPerosn(){
   

//            let object: AVObject = AVObject.init(className: "fuzongjian")
//            object.setObject(nameArr![0], forKey: "NewName")
//            object.setObject(ageArr![0], forKey: "NewAge")
//            object.setObject(hobbyArr![0], forKey: "NewHobby")
//            object.setObject(sayingArr![0], forKey: "NewSaying")
//            object.saveInBackground()

        for i:Int in 0...4{
            autoreleasepool({ () -> () in
                print(i)
                let object: AVObject = AVObject.init(className: "person")
                object.setObject(nameArr![i], forKey: "name")
                object.setObject(ageArr![i], forKey: "age")
                object.setObject(hobbyArr![i], forKey: "hobby")
                object.setObject(sayingArr![i], forKey: "saying")
                object.saveInBackground()
            })
        }
    }
    
    
    // 构建和保存对象
    func createFolder (){
        let folder: AVObject = AVObject.init(className: "fuzongjian")
    
        folder.setObject("付宗建", forKey: "name")
        folder.setObject(1, forKey: "priority")
        folder.saveInBackground()
    }
    func getObjectId (){
        let todo: AVObject = AVObject.init(className: "fuzongjian")
        todo.setObject("工程师开会", forKey: "title")
        todo.setObject("每周工程师会议，周一下午2点", forKey: "content")
        todo.setObject("会议室", forKey: "location")
        todo.saveInBackgroundWithBlock { (bool, error) -> Void in
            if bool{
                print(todo.objectId)
            }else{
                print("失败")
            }
        }
    }
    // 访问兑现属性 573574b5df0eea00635505de
    func getObjectProperty(){
        let query: AVQuery = AVQuery.init(className: "fuzongjian")
        query.getObjectInBackgroundWithId("573574b5df0eea00635505de") { (object, error) -> Void in
            let location = object["location"] as! String
            let content = object["content"] as! String
            
            let updateAt = object.updatedAt
            let createAt = object.createdAt
            
            print("location = \(location)  content = \(content)  updateAt = \(updateAt) createAt = \(createAt)")
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
