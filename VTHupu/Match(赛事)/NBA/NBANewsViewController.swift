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
        view.frame = CGRect(x: 0, y: 0, width: kScreenW,height: kScreenH - 108)
        view.rowHeight = 50
        view.showsVerticalScrollIndicator = false
        view.separatorColor = UIColor.gray
        view.register(HupuNewsCell.self,forCellReuseIdentifier: "HupuNewsCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [
            HupuNewsModel(title: "劲爆！超级巨星朱武涛拒绝NBA合同只因郑晓霞，“我一刻都不想离开她”", picture: "bear"),
            HupuNewsModel(title: "儿时回忆,粉丝自称金城武颜值可比朱武涛,后者回应金城武拿屁跟他比", picture: "bear"),
            HupuNewsModel(title: "劲爆！超级巨星朱武涛拒绝NBA合同只因郑晓霞，“我一刻都不想离开她”", picture: "bear"),
            HupuNewsModel(title: "劲爆！超级巨星朱武涛拒绝NBA合同只因郑晓霞，“我一刻都不想离开她”", picture: "bear")]
        
        view.addSubview(tableView)
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
    
    
}
