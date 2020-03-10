//
//  HupuVedioView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/10.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit
import AVKit

class HupuVedioView: UIView {
    
    private var title: String?
    
    private var url: String?
    
    
    init(frame: CGRect,title: String,url: String) {
        self.title = title
        self.url = url
        super.init(frame: frame)
        
        let player = AVPlayer(url: NSURL(string: url)! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        //添加view播放的模式
        playerViewController.view.frame = CGRect(x: 20, y: 0, width: self.bounds.width - 40, height: self.bounds.height)
        addSubview(playerViewController.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
