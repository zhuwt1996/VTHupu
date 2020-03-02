//
//  ViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/2.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

/** 电池信号栏的宽度 */
let kStatusBarH : CGFloat = 20
/** Nav的高度 */
let kNavigationBarH : CGFloat = 44
/** TabBar的高度 */
let kTabbarH : CGFloat = 44
/** 屏幕的宽度 */
let kScreenW = UIScreen.main.bounds.width
/** 屏幕的高度 */
let kScreenH = UIScreen.main.bounds.height


private let kTitleViewH : CGFloat = 40

class ViewController: UIViewController {
    
    fileprivate lazy var titleView: HupuPageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "赛事", "关注", "我的"]
        let view = HupuPageTitleView(frame: titleFrame, titles: titles)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI(){
        view.addSubview(titleView)
    }

}

