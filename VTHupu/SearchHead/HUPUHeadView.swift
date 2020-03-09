//
//  HUPUHeadView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/9.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUHeadView: UIView {
    
    
    private let publishTitles = ["发图文","发视频"]
    
    private let publishIcons = ["pic","vcd"]
    
    /** logo */
    lazy var hupuImg: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 5, y: 0, width: 65, height: 60))
        img.image = UIImage(named: "hupu")
        return img
    }()

    
    
    /** 搜索视图 */
    lazy var searchView: UIView = {
        let view = UIView(frame: CGRect(x: 75, y: 17, width: kScreenW - 120, height: 30))
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.init(hexString: "#F2F2F2")
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToSearch)))
        return view
    }()
    
    /** 搜索框滚动文字 */
    lazy var searchScrollView: SearchScrollView = {
        let view = SearchScrollView(frame: CGRect(x: 30, y: 8, width: kScreenW - 150, height: 15))
        view.timeInteval = 10.0
        view.dataSource = ["詹姆斯｜朱武涛｜湖人总冠军","哈登|威少|抗疫战士","杨毅死🐎|柯🐶吃💩|詹黑脑瘫"]
        view.direction = .up
        
        return view
    }()
    
    /** 搜索图片 */
    lazy var searchImg: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 10, y: 8, width: 15, height: 15))
        img.image = UIImage(named: "searchicon")
        return img
    }()
    
    /** 发布视图 */
    lazy var publishView: UIView = {
        let view = UIView(frame: CGRect(x: kScreenW - 38, y: 3, width: 30, height: 45))
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(hupuImg)
        
        searchView.addSubview(searchScrollView)
        searchView.addSubview(searchImg)
        addSubview(searchView)
        
        publishView.addSubview(publishImg)
        publishView.addSubview(publishLab)
        addSubview(publishView)
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
