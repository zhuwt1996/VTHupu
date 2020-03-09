//
//  CommunityTopicHeader.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/9.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class CommunityTopicHeader: UICollectionReusableView {
    
    //分区头文本标签
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        //初始化分区头文本标签
        titleLabel.frame = CGRect(x: 15, y: 0, width: 200, height: 15)
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.gray
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
