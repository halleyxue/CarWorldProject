//
//  LoginViewController.swift
//  CarWorld
//
//  Created by yangxue_pc on 2018/12/24.
//  Copyright © 2018年 yangxue_pc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var userText: UITextField!
    var pwdText: UITextField!
    var underView:UIView?
    
    let URL_TEST = "http://172.20.10.3:8080/CarWorld/admin/login.do"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavition()
        self.makeLoginUI()
    }
    func setNavition() -> Void{
        self.navigationItem.title = "登陆"
    }
    
    func makeLoginUI() -> Void{
        //账户框
        let userImage = UIImageView.init(frame:CGRect.init(x: 50, y: UIScreen.main.bounds.height/4, width: 30,height: 30))
        userImage.image = UIImage(named: "user")
        self.view.addSubview(userImage)
        userText = UITextField.init(frame: CGRect.init(x: userImage.frame.maxX+10, y: UIScreen.main.bounds.height/4, width: UIScreen.main.bounds.width - 90 - userImage.frame.width, height: 35))
        userText?.placeholder = "请输入您的账户"
        userText.tintColor = UIColor.gray
        self.view.addSubview(userText)
        let lineU = UIView.init(frame: CGRect.init(x: userImage.frame.maxX+10, y: userImage.frame.maxY, width: UIScreen.main.bounds.width - 150, height: 1))
        lineU.backgroundColor = UIColor.orange
        self.view.addSubview(lineU)
        
        //密码框
        let pwdImage = UIImageView.init(frame: CGRect.init(x: 50, y: lineU.frame.maxY + 40, width: 30, height: 30))
        pwdImage.image = UIImage(named: "password")
        self.view.addSubview(pwdImage)
        pwdText = UITextField.init(frame: CGRect.init(x: pwdImage.frame.maxX+10, y: lineU.frame.maxY + 40, width: UIScreen.main.bounds.width - 90 - pwdImage.frame.width, height: 35))
        pwdText?.placeholder = "请输入密码"
        pwdText.tintColor = UIColor.gray
        self.view.addSubview(pwdText)
        let lineP = UIView.init(frame: CGRect.init(x: pwdImage.frame.maxX+10, y: pwdImage.frame.maxY, width: UIScreen.main.bounds.width - 150, height: 1))
        lineP.backgroundColor = UIColor.orange
        self.view.addSubview(lineP)
        
        //登陆btn
        let loginBtn = UIButton.init(frame: CGRect.init(x: 60, y: lineP.frame.maxY + 70, width: UIScreen.main.bounds.width - 120, height: 40))
        loginBtn.setTitle("登陆", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor.orange
        loginBtn.layer.cornerRadius = 6
        loginBtn.addTarget(self, action:#selector(btnClick(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(loginBtn)
    }
    
    @objc func btnClick(_ btn:UIButton) -> Void{
        if (userText != nil) && (userText.text?.count != 0) {
            if (pwdText != nil) && (pwdText.text?.count != 0){
//                self.loadData()
                let user = Person(username: userText.text!, password: pwdText.text!)
                let encoder: JSONEncoder = JSONEncoder()
                let userInfo = JsonString(jsonStr: [user])
                let jsonStr = try? encoder.encode(userInfo)
                let param = String(data: jsonStr!, encoding: .utf8)!
                HttpUtil.shareNetwork.getData(URL_TEST)
                print(param)
            }else{
                self.alertView(message: "请输入密码")
            }
        }else{
            self.alertView(message: "请输入账号")
        }
    }
    
    func alertView(message: String) -> Void{
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "确定", style: .default)
        alert.addAction(confirm)
        self.present(alert, animated: true, completion: nil)
    }

}
