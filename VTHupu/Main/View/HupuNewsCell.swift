//
//  HupuNewsCell.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/9.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HupuNewsCell: UITableViewCell {
    
    //标题文本标签
    var titleLabel = UILabel()
    //图片视图
    var pictureView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.frame = CGRect.init(x: 20, y: 0,width: kScreenW/4 * 3, height: 50)
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        pictureView.frame = CGRect(x: kScreenW/4 * 3 + 3, y: 0, width: kScreenW/4 - 6, height: 50)
        pictureView.contentMode = .scaleAspectFit
        contentView.addSubview(pictureView)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置数据
    func setData(_ model : HupuNewsModel) {
        titleLabel.text = model.title
        pictureView.image = UIImage(named: model.picture)
    }

}
