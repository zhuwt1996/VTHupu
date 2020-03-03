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

    fileprivate lazy var titleView: HupuMatchTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["NBA", "国际足球", "关注", "CBA"]
        let view = HupuMatchTitleView(frame: titleFrame, titles: titles)
        return view
    }()
    
    /** 内容控制器 */
    fileprivate lazy var pageContentView: HupuMatchContentView = {
        let contentH = kScreenH - (kStatusBarH + kNavigationBarH + kTitleViewH + kTabbarH)
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        // 确定所有子控制器
        var childVcs = [UIViewController]()
        childVcs.append(HUPUNBAViewController())
        childVcs.append(HUPUFootballViewController())
        childVcs.append(HUPUFollowViewController())
        childVcs.append(HUPUCBAViewController())
        
        let contentView = HupuMatchContentView(frame: contentFrame, childVcs: childVcs, parentViewcontrol: self)
        //        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(titleView)
        view.addSubview(pageContentView)
    }

}
