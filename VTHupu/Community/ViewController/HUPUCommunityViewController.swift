//
//  HUPUCommunityViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/3.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUCommunityViewController: UIViewController {

    private let titles = ["关注","话题"]
    
    private let controllers = [CommunityFollowViewController(),CommunityTopicViewController()]
    
    lazy var headView: HUPUHeadView = {
        let view = HUPUHeadView(frame: CGRect(x: 0, y: 20, width: kScreenW, height: 60))
        return view
    }()
    
    lazy var communityTitleMenu: CKSlideMenu = {
        let menu = CKSlideMenu(frame: CGRect(x:0,y:68,width:view.frame.width / 4,height:40), titles: titles, childControllers: controllers)
        //内容的frame
        menu.bodyFrame = CGRect.init(x: 0, y: 108, width: view.frame.width, height: view.frame.height - 108)
        //隐藏分割线
        menu.isLineHidden = true
        //指示器的样式
        menu.indicatorStyle = SlideMenuIndicatorStyle.followText
        //默认选中第一个
        menu.scrollToIndex(0)
        //固定型菜单，不需要自适应视图
        menu.isFixed = true
        //选中放大标题
        menu.titleStyle = .transfrom
        menu.unSelectedColor = UIColor.gray
        menu.isIndicatorHidden = true
        menu.selectedColor = UIColor.black
        menu.font = UIFont.systemFont(ofSize: 16)
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func setupUI(){
        
        view.addSubview(headView)
        view.addSubview(communityTitleMenu)
        
    }
    
}
