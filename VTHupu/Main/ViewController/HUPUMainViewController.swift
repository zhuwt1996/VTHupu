//
//  ViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/2.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUMainViewController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v1  = HUPURecommandViewController()
        let item1 : UITabBarItem = UITabBarItem (title: "推荐", image: UIImage(named: "reconmand.png"), selectedImage: UIImage(named: "reconmand_1"))
        v1.tabBarItem = item1
        
        let v2 = HUPUMatchViewController()
        let item2 : UITabBarItem = UITabBarItem (title: "赛事", image: UIImage(named: "game.png"), selectedImage: UIImage(named: "game_1.png"))
        v2.tabBarItem = item2
        
        let v3 = HUPUCommunityViewController()
        let item3 : UITabBarItem = UITabBarItem (title: "社区", image: UIImage(named: "community"), selectedImage: UIImage(named: "community_1"))
        v3.tabBarItem = item3
        
        let v4 = HUPUVedioViewController()
        let item4 : UITabBarItem = UITabBarItem (title: "视频", image: UIImage(named: "vedio"), selectedImage: UIImage(named: "vedio_1"))
        v4.tabBarItem = item4
        
        let v5 = HUPUMoreViewController()
        let item5 : UITabBarItem = UITabBarItem (title: "更多", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        v5.tabBarItem = item5
        
        let tabArray = [v1, v2, v3, v4, v5]
        self.viewControllers = tabArray
        
        //默认选中“赛事”
        self.selectedIndex = 1
        
        tabBar.tintColor = UIColor.red
    }

}

