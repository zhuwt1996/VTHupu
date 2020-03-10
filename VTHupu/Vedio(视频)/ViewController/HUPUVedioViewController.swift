//
//  HUPUVedioViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/3.
//  Copyright © 2020 ZWT. All rights reserved.
//
// MARK:- 视频播放

import UIKit
import AVKit

class HUPUVedioViewController: UIViewController {

    lazy var headView: HUPUHeadView = {
        let view = HUPUHeadView(frame: CGRect(x: 0, y: 20, width: kScreenW, height: 60))
        return view
    }()
    
    lazy var playerView: HupuVedioView = {
        let view = HupuVedioView(frame: CGRect(x: 0, y: 80, width: kScreenW, height: 200), title: "", url: "https://v.hoopchina.com.cn/xiguapp/v02004170000blr0rhimac2sjk6m3mpg.mp4?auth_key=1583832044-0-0-f53cb4e384044fdc74dcd897b963ab51")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(headView)
        
//        let player = AVPlayer(url: NSURL(string: "https://v.hoopchina.com.cn/xiguapp/v02004170000blr0rhimac2sjk6m3mpg.mp4?auth_key=1583832044-0-0-f53cb4e384044fdc74dcd897b963ab51")! as URL)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        //添加view播放的模式
//        playerViewController.view.frame = CGRect(x: 20, y: 100, width: self.view.bounds.width - 40, height: 200)
//        self.addChild(playerViewController)
//        self.view.addSubview(playerViewController.view)
        view.addSubview(playerView)
        
    }
    
}
