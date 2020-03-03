//
//  HUPUMatchViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/3.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

// MARK:- 赛事

private let kTitleViewH : CGFloat = 40

class HUPUMatchViewController: UIViewController {

    fileprivate lazy var titleView: HupuTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["NBA", "国际足球", "关注", "CBA"]
        let view = HupuTitleView(frame: titleFrame, titles: titles)
        view.delegate = self
        return view
    }()
    
    /** 内容控制器 */
    fileprivate lazy var contentView: HupuContentView = {
        let contentH = kScreenH - (kStatusBarH + kNavigationBarH + kTitleViewH + kTabbarH)
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        // 确定所有子控制器
        var childVcs = [UIViewController]()
        childVcs.append(HUPUNBAViewController())
        childVcs.append(HUPUFootballViewController())
        childVcs.append(HUPUFollowViewController())
        childVcs.append(HUPUCBAViewController())
        
        let contentV = HupuContentView(frame: contentFrame, childVcs: childVcs, parentViewcontrol: self)
        contentV.delegate = self
        return contentV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func setupUI(){
        // 设置导航栏
        setupNavigationBar()
        // 0.取消系统调整scrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(titleView)
        view.addSubview(contentView)
    }
    
    fileprivate func setupNavigationBar(){
        
    }

}

// MARK:- HupuTitleViewDelegate 点击了label需要同步content的变化
extension HUPUMatchViewController: HupuTitleViewDelegate{

    func pageTitleView(titleView: HupuTitleView, selectedIndex: Int) {

    }
}

// MARK:- HupuContentViewDelegate 点击了content需要同步label的变化
extension HUPUMatchViewController: HupuContentViewDelegate{
    
    func pageContentView(titleView: HupuContentView, selectedIndex: Int) {
        
    }
}
