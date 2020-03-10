//
//  HupuVedioModel.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/10.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HupuVedioModel: NSObject {
    
    //视频标题
    var title : String
    //视频地址
    var url : String
    
    init(title: String, url: String) {
        self.title = title
        self.url = url
    }

}
