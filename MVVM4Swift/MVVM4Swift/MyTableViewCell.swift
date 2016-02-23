//
//  MyTableViewCell.swift
//  MVVM4Swift
//
//  Created by Seven on 16/2/2.
//  Copyright © 2016年 Seven. All rights reserved.
//

import UIKit
import Alamofire

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var header: UIImageView!
    
    
    override func awakeFromNib() {
        
    }
    
    func setValueWithModel(model:PublicModel)->Void{
        self.name.text = model.screen_name
        self.desc.text = model.text
        Alamofire.request(.GET, model.profile_image_url!).validate().responseData { (response) -> Void in
            if response.result.isSuccess {
                let img = UIImage(data: response.result.value!)
                self.header.image = img
            }
            
        }
    }
    
}
