//
//  AVQueryController.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit

class AVQueryController: SuperViewController {
    var array : Array<Person>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        getAllPerson()
        
        createPerson()
    }
    
    func createPerson(){
        let person = Person()
        person.name = "fuzongjian"
        person.hobby = "羽毛球"
        person.saying = "no pains no gains"
        person.age = 20
        person.save()
    }
    // 获得所有的数据 但是没法和对象绑定
    func getAllPerson(){
        let query:AVQuery = AVQuery.init(className: "person")
//        let allArray = query.getFirstObject()
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
           print(objects)
    }
    }
    func getPerson(object: AVObject) ->Person{
        let person = Person()
        person.name = (object["name"] as? String)
        person.hobby = object["hobby"] as? String
        person.age = (object["age"] as? Int32)!
        person.saying = object["saying"] as? String
        return person
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
