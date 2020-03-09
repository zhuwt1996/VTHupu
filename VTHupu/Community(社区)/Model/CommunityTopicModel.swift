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
    
    class func initWithDataSource() -> [[CommunityTopicModel]]{
        
        return [
            [CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "灰熊", picture: "bear"),CommunityTopicModel(name: "雄鹿", picture: "buck"),CommunityTopicModel(name: "快船", picture: "clipper"),CommunityTopicModel(name: "小牛", picture: "cow"),CommunityTopicModel(name: "尼克斯", picture: "knicks"),CommunityTopicModel(name: "湖人", picture: "laker"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "步行者", picture: "pacer"),CommunityTopicModel(name: "猛龙", picture: "raptor"),CommunityTopicModel(name: "火箭", picture: "rocket"),CommunityTopicModel(name: "马刺", picture: "spurs"),CommunityTopicModel(name: "太阳", picture: "suns"),CommunityTopicModel(name: "雷霆", picture: "thunder"),CommunityTopicModel(name: "森林狼", picture: "wolves"),CommunityTopicModel(name: "勇士", picture: "worriors")],
            [CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "灰熊", picture: "bear"),CommunityTopicModel(name: "雄鹿", picture: "buck"),CommunityTopicModel(name: "快船", picture: "clipper"),CommunityTopicModel(name: "小牛", picture: "cow"),CommunityTopicModel(name: "尼克斯", picture: "knicks"),CommunityTopicModel(name: "湖人", picture: "laker"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "步行者", picture: "pacer"),CommunityTopicModel(name: "猛龙", picture: "raptor"),CommunityTopicModel(name: "火箭", picture: "rocket"),CommunityTopicModel(name: "马刺", picture: "spurs"),CommunityTopicModel(name: "太阳", picture: "suns"),CommunityTopicModel(name: "雷霆", picture: "thunder"),CommunityTopicModel(name: "森林狼", picture: "wolves"),CommunityTopicModel(name: "勇士", picture: "worriors")],
            [CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "76人", picture: "76ers")],
            [CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "魔术", picture: "magic")]
        ]
        
    }
    
    
}
