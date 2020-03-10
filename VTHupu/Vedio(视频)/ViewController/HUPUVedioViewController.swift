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
    
    var vedioDatasource = [HupuVedioModel]()

    lazy var headView: HUPUHeadView = {
        let view = HUPUHeadView(frame: CGRect(x: 0, y: 20, width: kScreenW, height: 60))
        return view
    }()
    
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.frame = CGRect(x: 0, y: 80, width: kScreenW,height: kScreenH - 60)
        view.rowHeight = 200
        view.showsVerticalScrollIndicator = false
        view.separatorColor = UIColor.gray
        view.separatorInset = UIEdgeInsets.zero
        view.layoutMargins = UIEdgeInsets.zero
        view.register(HupuVedioCell.self,forCellReuseIdentifier: "HupuVedioCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vedioDatasource = [
            HupuVedioModel(title: "男默女泪！看完这部电影你就懂了人生！", url: "https://v.hoopchina.com.cn/xiguapp/v02004170000blr0rhimac2sjk6m3mpg.mp4?auth_key=1583832044-0-0-f53cb4e384044fdc74dcd897b963ab51"),
            HupuVedioModel(title: "十年磨一剑，残疾导演郭敬明历经十年终于拍出小时代！", url: "https://v.hoopchina.com.cn/xiguapp/v02004170000blr0rhimac2sjk6m3mpg.mp4?auth_key=1583832044-0-0-f53cb4e384044fdc74dcd897b963ab51")]
        
        view.backgroundColor = UIColor.white
        view.addSubview(headView)
        
        view.addSubview(tableView)
    }
    
    
}


extension HUPUVedioViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vedioDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HupuVedioCell", for: indexPath) as! HupuVedioCell
        let model = vedioDatasource[indexPath.row]
        cell.setData(model)
        return cell
    }
    
    //下滑线对准最左边
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
}
