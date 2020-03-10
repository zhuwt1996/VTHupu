//
//  HupuVedioView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/10.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit
import AVKit

class HupuVedioCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let lab = UILabel(frame: CGRect(x: 10, y: 5, width: self.bounds.width - 20, height: 20))
        lab.textColor = UIColor.black
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 16)
        return lab
    }()
    
    lazy var playerViewController: AVPlayerViewController = {
        let playerViewController = AVPlayerViewController()
        
        //添加view播放的模式
        playerViewController.view.frame = CGRect(x: 10, y: 25, width: self.bounds.width - 20, height: 15)
        return playerViewController
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(playerViewController.view)
    }
    
    //设置数据
    func setData(_ model : HupuVedioModel) {
        titleLabel.text = model.title
        playerViewController.player = AVPlayer(url: NSURL(string: model.url)! as URL)
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
    
    
}
