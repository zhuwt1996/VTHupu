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
    
    private let titles = ["NBA","国际足球","关注","CBA","中国足球","数码","王者荣耀"]
    
    private let publishTitles = ["发图文","发视频"]
    
    private let publishIcons = ["pic","vcd"]
    
    private let searchText = "詹姆斯｜朱武涛｜湖人总冠军"
    
    private let controllers = [HUPUNBAViewController(),HUPUFollowViewController(),HUPUFollowViewController(),HUPUCBAViewController(),HUPUFootballViewController(),HUPUFollowViewController(),HUPUFollowViewController()]
    

    lazy var matchTitleMenu: CKSlideMenu = {
        let menu = CKSlideMenu(frame: CGRect(x:0,y:68,width:view.frame.width - 60,height:40), titles: titles, childControllers: controllers)
        //内容的frame
        menu.bodyFrame = CGRect.init(x: 0, y: 108, width: view.frame.width, height: view.frame.height - 104)
        //隐藏分割线
        menu.isLineHidden = true
        //指示器的样式
        menu.indicatorStyle = SlideMenuIndicatorStyle.followText
        //默认选中第一个
        menu.scrollToIndex(0)
        //选中放大标题
        menu.titleStyle = .transfrom
        menu.unSelectedColor = UIColor.gray
        menu.isIndicatorHidden = true
        menu.selectedColor = UIColor.black
        menu.font = UIFont.systemFont(ofSize: 16)
        return menu
    }()
    
    lazy var hupuImg: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 5, y: 20, width: 65, height: 60))
        img.image = UIImage(named: "hupu")
        return img
    }()
    
    lazy var searchView: UIView = {
        let view = UIView(frame: CGRect(x: 75, y: 37, width: kScreenW - 120, height: 30))
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.init(hexString: "#F2F2F2")
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToSearch)))
        return view
    }()
    
    
    lazy var searchImg: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 10, y: 8, width: 15, height: 15))
        img.image = UIImage(named: "searchicon")
        return img
    }()
    
    lazy var searchLab: UILabel = {
        let lab = UILabel(frame: CGRect(x: 45, y: 8, width: kScreenW - 150, height: 15))
        lab.text = searchText
        lab.textColor = UIColor(hexString: "C7C7C7")
        lab.font = UIFont.systemFont(ofSize: 12)
        return lab
    }()
    
    lazy var publishView: UIView = {
        let view = UIView(frame: CGRect(x: kScreenW - 38, y: 20, width: 30, height: 45))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(publish)))
        return view
    }()
    
    lazy var publishImg: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 17, width: 22, height: 22))
        img.image = UIImage(named: "publish")
        
        return img
    }()
    
    lazy var publishLab: UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: 40, width: 30, height: 10))
        lab.text = "发布"
        lab.textColor = UIColor.gray
        lab.font = UIFont.systemFont(ofSize: 9)
        return lab
    }()
    
    lazy var channelView: UIView = {
        let view = UIView(frame: CGRect(x: kScreenW - 60, y: 68, width: 60, height: 35))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeChannel)))
        return view
    }()
    
    lazy var channelLab: UILabel = {
        let lab = UILabel(frame: CGRect(x: 12, y: 2, width: 35, height: 35))
        lab.text = "频道"
        lab.textColor = UIColor.black
        lab.font = UIFont.systemFont(ofSize: 16)
        return lab
    }()
    
    lazy var channelImg: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 45, y: 10, width: 10, height: 20))
        img.image = UIImage(named: "channel")
        return img
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
        view.addSubview(hupuImg)
        
        searchView.addSubview(searchImg)
        searchView.addSubview(searchLab)
        view.addSubview(searchView)
        
        publishView.addSubview(publishImg)
        publishView.addSubview(publishLab)
        view.addSubview(publishView)
        
        channelView.addSubview(channelLab)
        channelView.addSubview(channelImg)
        view.addSubview(channelView)
    }
    
    @objc func goToSearch(){
        print("search")
    }
    
    @objc func publish(){
        let menu = PopupMenu.showRelyOnView(view: publishImg, titles: publishTitles, icons: publishIcons, menuWidth: 115, didSelectRow: { (index, value, menu) in
            if index == 0{
                print("发图文")
            }else if index == 1{
                print("发视频")
            }
        }) { (menu) in
            menu.backColor = UIColor.white
            menu.separatorColor = UIColor.gray
            menu.priorityDirection = PopupMenuPriorityDirection.top
            menu.borderWidth = 1
            menu.borderColor = UIColor.clear
            menu.arrowDirection = .left
            menu.cornerRadius = 10.0
            menu.rectCorner = [.topLeft,.topRight,.bottomRight,.bottomLeft]
        }
        print(menu.arrowDirection)
    }
    
    
    @objc func changeChannel(){
        print("change...")
    }

}

