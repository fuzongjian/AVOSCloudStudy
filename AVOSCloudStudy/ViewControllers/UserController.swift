//
//  UserController.swift
//  AVOSCloudStudy
//
//  Created by 陈舒澳 on 16/5/13.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit

class UserController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        createUser()
//        login()
//        currentUser()
//        resetPassword()
//        registerEmail()
        regiserPhoneNumber()
    }
    // 电话号码注册
    func regiserPhoneNumber(){
        let user: AVUser = AVUser()
        user.username = "15268598930"
        user.password = "123456789"
        user.mobilePhoneNumber = "15268598930"
        user.signUpInBackgroundWithBlock { (bool, error) -> Void in
            if bool {
                print("验证码已发")
            }else{
                print("")
            }
        }
    }
    // 邮箱注册
    func registerEmail(){
        let user: AVUser = AVUser()
        user.username = "fu_zongjian@163.com"
        user.password = "123456789"
        user.email = "fu_zongjian@163.com"
        user["gender"] = "boy"
        user.signUpInBackgroundWithBlock { (bool, error) -> Void in
            if bool{
                print("用户注册成功")
                let user: AVUser = AVUser.currentUser()
                print("\(user.email)")
            }
        }
    }
    // 密码重置
    func resetPassword(){
        let user = AVUser.currentUser()
        print(user.username)
        if user != nil{
            user.updatePassword("123456789", newPassword: "456789", block: { (object: AnyObject?, error: NSError?) -> Void in
                if error != nil{
                    print("密码重置成功")
                }else{
                    print("密码重置失败")
                }
            })
        }
    }
    // 获取当前用户(如果用户在登录状态可以获取)
    func currentUser(){
        let user = AVUser.currentUser()
        if user != nil{
            print("\(user.username) \(user.password)")
        }
    }
    // 用户登录
    func login(){
        var error: NSError?
        var user: AVUser?
        do {
            user = try AVUser.logInWithUsername("付宗建", password: "123456789")
        } catch let error1 as NSError{
            error = error1
            user = nil
        }
        if error == nil{
            print("登录成功")
        }
    }
    // 创建注册用户
    func createUser () {
        let user = AVUser()
        user.username = "付宗建"
        user.password = "123456789"
        var error: NSError?
        do {
            try user.signUp()
        }catch let error1 as NSError{
            error = error1
        }
        if error == nil{
            print("用户注册成功")
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
