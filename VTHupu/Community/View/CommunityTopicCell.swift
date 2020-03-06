//
//  CommunityTopicCell.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/6.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class CommunityTopicCell: UICollectionViewCell {
    
    //标题文本标签
    var titleLabel = UILabel()
    //产品图片视图
    var pictureView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //初始化产品图片视图
        pictureView.frame = CGRect(x: 15, y: 8, width: 45, height: 45)
        pictureView.contentMode = .scaleAspectFit
        contentView.addSubview(pictureView)
        
        //初始化标题文本标签
        titleLabel.frame = CGRect.init(x: 15, y: 55,width: 45, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置数据
    func setData(_ model : CommunityTopicModel) {
        titleLabel.text = model.name
        pictureView.image = UIImage(named: model.picture)
    }
}
