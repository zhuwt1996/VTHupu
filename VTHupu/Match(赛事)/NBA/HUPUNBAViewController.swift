//
//  HUPUNBAViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/3.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUNBAViewController: UIViewController {

    private let titles = ["热议","新闻","赛程","数据"]
    
    private let controllers = [NBANewsViewController(),NBANewsViewController(),HUPUFollowViewController(),HUPUFollowViewController()]
    
    
    lazy var matchTitleMenu: CKSlideMenu = {
        let menu = CKSlideMenu(frame: CGRect(x:0,y:0,width:view.frame.width - kScreenW/2,height:40), titles: titles, childControllers: controllers)
        //内容的frame
        menu.bodyFrame = CGRect.init(x: 0, y: 40, width: view.frame.width, height: view.frame.height - 40)
        //隐藏分割线
        menu.isLineHidden = true
        //指示器的样式
        menu.indicatorStyle = SlideMenuIndicatorStyle.followText
        //默认选中第二个
        menu.scrollToIndex(1)
        //固定型菜单，不需要自适应视图
        menu.isFixed = true
        //选中放大标题
        menu.titleStyle = .transfrom
        menu.bottomPadding = 5
        menu.selectedColor = UIColor.black
        menu.unSelectedColor = UIColor.gray
        menu.font = UIFont.systemFont(ofSize: 14)
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func setupUI(){
        // 设置导航栏
        setupNavigationBar()
        view.addSubview(matchTitleMenu)
    }
    
    fileprivate func setupNavigationBar(){
        
    }
}
