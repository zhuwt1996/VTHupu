//
//  NBANewsViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/9.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class NBANewsViewController: UIViewController {
    
    var tableViewData = [HupuNewsModel]()
    
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.frame = CGRect(x: 0, y: 0, width: kScreenW,height: kScreenH - 200)
        view.rowHeight = 80
        view.showsVerticalScrollIndicator = false
        view.separatorColor = UIColor.gray
        view.separatorInset = UIEdgeInsets.zero
        view.layoutMargins = UIEdgeInsets.zero
        view.register(HupuNewsCell.self,forCellReuseIdentifier: "HupuNewsCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [
            HupuNewsModel(title: "神仙爱情！超级巨星朱武涛拒绝NBA合同只因郑晓霞，“我一刻都不想离开她”", picture: "we"),
            HupuNewsModel(title: "有颜任性！粉丝评朱武涛颜值可比彭于晏,后者回应彭于晏拿屁跟他比", picture: "pyy"),
            HupuNewsModel(title: "前无古人！朱武涛面对詹姆斯砍下188分63篮板82助攻！", picture: "james"),
            HupuNewsModel(title: "彻底打服！乔丹:还好我退役得早，不然朱武涛能把我屎都打出来！", picture: "Jordan"),
            HupuNewsModel(title: "凌波微步！朱武涛无敌变相晃倒九人，澳洲狗博古特直接双腿骨折！", picture: "dog"),
            HupuNewsModel(title: "没救了！朱武涛轰下300分,中国男篮仍负赤道几内亚！", picture: "nl"),
            HupuNewsModel(title: "飞龙在天！朱武涛使出亢龙不悔旋风式扣篮，网友：电视剧没有骗人！", picture: "fire"),
            HupuNewsModel(title: "实力获认可！众NBA球星表示做梦都想和朱武涛做队友！", picture: "star")
        ]
        
        view.addSubview(tableView)
        
        let line = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 0.5))
        line.backgroundColor = UIColor.gray
        view.addSubview(line)
    }
    
    
}


extension NBANewsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HupuNewsCell", for: indexPath) as! HupuNewsCell
        let model = tableViewData[indexPath.row]
        cell.setData(model)
        return cell
    }
    
    //下滑线对准最左边
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
}
