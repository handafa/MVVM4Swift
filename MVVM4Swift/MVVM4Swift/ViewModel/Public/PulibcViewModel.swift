//
//  PulibcViewModel.swift
//  MVVM4Swift
//
//  Created by Seven on 16/1/28.
//  Copyright © 2016年 Seven. All rights reserved.
//

import UIKit
import SwiftyJSON
class PulibcViewModel: ViewModel {
    
    
    
    
    override init() {
        super.init();
    }
    
    /**
     获取微博列表
     */
    func fetchPublicWeiBo() ->Void{
        HLRequest.netRequestGETWithRequestURL(REQUESTPUBLICURL, params: ["access_token":ACCESSTOKEN,"count":"20"], suceess: { (result) -> Void in
            if let res = result as? NSDictionary{
                self.fetchValueSuccessWithJson(res)
            }
            }, failure: { (result) -> Void in
            self.failure!(result: result)
        });
    }
    
    /**
     解析数据
     
     - parameter result: 数据源
     */
    func fetchValueSuccessWithJson(result:NSDictionary)->Void{
        let tmps = result.objectForKey("statuses") as! NSArray
        var models = [PublicModel]()
        for var i = 0;i < tmps.count;i++ {
            let model = PublicModel()
            let dict:NSDictionary = tmps[i] as! NSDictionary
            debugPrint(dict)
            model.text = dict.objectForKey("text") as? String
            model.created_at = dict.objectForKey("created_at") as? String
            model.profile_image_url = dict.objectForKey("user")?.objectForKey("profile_image_url") as? String
            model.screen_name = dict.objectForKey("user")?.objectForKey("screen_name") as? String
            models.append(model)
        }
        self.success!(result: models)
    }
}
