//
//  CommunityCatageryCell.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/6.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class CommunityCatageryCell: UITableViewCell {

    //标题文本标签
    var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //选中样式无
        selectionStyle = .none
        
        //初始化标题文本标签
        titleLabel.frame = CGRect(x: 0, y: 0, width: 90, height: 50)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.black
        titleLabel.highlightedTextColor = UIColor.red
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.backgroundColor = selected ? UIColor.white
            : UIColor(hexString: "#F4F8FB")
        isHighlighted = selected
        titleLabel.textColor = selected ? UIColor.red : UIColor.black
    }

}
