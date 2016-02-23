//
//  HLRequest.swift
//  MVVM4Swift
//
//  Created by Seven on 16/1/27.
//  Copyright © 2016年 Seven. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class HLRequest: NSObject {
    
    
    /**
     监测网络的可链接性
     
     - parameter url: 目标连接
     
     - returns: 是否可以连接
     */
    class func netWorkReachabilityWithURLString(url:String)->Bool{
        return true;
    }
    
    /**
     post请求
     - parameter url:     目标连接
     - parameter params:  参数
     - parameter suceess: 成功
     - parameter failure: 失败
     */
    class func netRequestPOSTWithRequestURL(url:String,params:Dictionary<String,AnyObject>,suceess:onSuccess,failure:onFailure) -> Void{
        Alamofire.request(.POST, url, parameters: params).responseJSON { (response) -> Void in
            if response.result.isSuccess{
                suceess(result: response.result.value)
            }else{
                failure(result: response.result.error)
            }
        }
        
    }
    
    /**
     GET请求
     
     - parameter url:     目标连接
     - parameter params:  参数
     - parameter suceess: 成功
     - parameter failure: 失败
     */
    class func netRequestGETWithRequestURL(url:String,params:Dictionary<String,AnyObject>,suceess:onSuccess,failure:onFailure) -> Void{
        Alamofire.request(.GET, url, parameters: params).responseJSON { (response) -> Void in
            if response.result.isSuccess{
                suceess(result: response.result.value)
            }else{
                failure(result: response.result.error)
            }
        }
    }
}
