//
//  Config.swift
//  MVVM4Swift
//
//  Created by Seven on 15/12/30.
//  Copyright © 2015年 Seven. All rights reserved.
//

import Foundation

// 请求成功
typealias onSuccess = (result:Any?) ->Void

// 请求失败
typealias onFailure = (result:Any?) ->Void



public let ACCESSTOKEN = "2.00NofgBD0L1k4pc584f79cc48SKGdD"

// 请求公共微博的网络接口
public let REQUESTPUBLICURL = "https://api.weibo.com/2/statuses/public_timeline.json"