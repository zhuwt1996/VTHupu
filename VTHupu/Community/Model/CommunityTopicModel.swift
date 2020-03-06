//
//  CommunityFollowModel.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/6.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class CommunityTopicModel: NSObject {

    //小分类名称
    var name : String
    //小分类图片
    var picture : String
    
    init(name: String, picture: String) {
        self.name = name
        self.picture = picture
    }
    
}
