//
//  UserInfo.swift
//  CarWorld
//
//  Created by yangxue_pc on 2018/12/24.
//  Copyright © 2018年 yangxue_pc. All rights reserved.
//

import Foundation

struct Person: Codable {
    var username: String
    var password: String
}

struct JsonString: Codable {
    let jsonStr: [Person]
}
