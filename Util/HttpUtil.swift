//
//  HttpUtil.swift
//  CarWorld
//
//  Created by yangxue_pc on 2018/12/24.
//  Copyright © 2018年 yangxue_pc. All rights reserved.
//

import UIKit
import Alamofire

class HttpUtil: NSObject {
    
    //网络请求成功闭包（回调成功结果）
    typealias NetworkSuccess = (_ response:AnyObject) -> ()
    
    //网络请求失败闭包（回调失败结果）
    typealias NetworkFailure = (_ error:NSError) -> ()
    
    /**
     *  网络请求单例
     */
    static let shareNetwork = HttpUtil()
    
    /**
     POST 请求
     - parameter urlString:  请求URL
     - parameter parameters: 请求参数
     */
    func Post(_ urlString: String, parameters: String){
        let params = jsonToDictionary(from: parameters) ?? [String : Any]()
        print(params)
        AF.request(urlString, method: .post, parameters: parameters as? [String : Any] , encoding: JSONEncoding.default).responseString{ response in
            print(response.result)
            switch response.result.isSuccess{
            case true:
                print(response.value!)
            case false:
                print(response.result.error as Any)
            }
        }
    }
    
    func getData(_ urlString: String){
        
        AF.request(urlString).responseString { response in
            print(response.result)
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
    }
    
    func jsonToDictionary(from text: String) -> [String: Any]? {
        guard let data = text.data(using: .utf8) else {return nil}
        let anyResult = try? JSONSerialization.jsonObject(with: data, options: [])
        return anyResult as? [String : Any]
    }
}
