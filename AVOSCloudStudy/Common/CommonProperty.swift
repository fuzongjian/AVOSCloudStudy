//
//  CommonProperty.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit
// 此处判断机型
let iPhone6Plus = (UIScreen.mainScreen().bounds.size.height == 736) ? true : false
let iPhone6 = (UIScreen.mainScreen().bounds.size.height == 667) ? true : false
let iPhone5 = (UIScreen.mainScreen().bounds.size.height == 568) ? true : false
let iPhone4 = (UIScreen.mainScreen().bounds.size.height == 480) ? true : false
// 此处获得屏幕的宽度和高度
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
// 此处获得设备的版本号
let IOSVERSION = Int(Float(UIDevice.currentDevice().systemVersion)!)

let KEY_LEAN_APPID = "rdrSVkCUnuYAXeCByj2kDpiy-gzGzoHsz"
let KEY_LEAN_APPKEY = "wvQc4L9xJ72l5ROi7w3rSuEW"
let KEY_LEAN_MASTERKEY = "PJoaFBf80YKhd4UtSVYLiw5i"
class CommonProperty: NSObject {

}
