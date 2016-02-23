//
//  ViewModel.swift
//  MVVM4Swift
//
//  Created by Seven on 16/1/28.
//  Copyright © 2016年 Seven. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var success:onSuccess?
    var failure:onFailure?
    
    /**
     接收传过来的Compliton
     
     - parameter success: 成功
     - parameter failure: 失败
     */
    func setCompliton(success:onSuccess,failure:onFailure)->Void{
        self.success = success;
        self.failure = failure;
    }
}
