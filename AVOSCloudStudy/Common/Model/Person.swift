//
//  Person.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit

class Person: AVObject,AVSubclassing {
   @NSManaged var name: String?
   @NSManaged var age : Int32
   @NSManaged var hobby: String?
   @NSManaged var saying: String?
}
