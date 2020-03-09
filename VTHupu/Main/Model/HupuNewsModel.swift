//
//  HupuNewsModel.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/9.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HupuNewsModel: NSObject {
    
    //新闻标题
    var title : String
    //新闻配图
    var picture : String
    
    init(title: String, picture: String) {
        self.title = title
        self.picture = picture
    }

}
