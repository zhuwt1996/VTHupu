//
//  CommunityTopicViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/6.
//  Copyright © 2020 ZWT. All rights reserved.
//
// MARK:- TableView ConlectionView的二级联动

import UIKit

class CommunityTopicViewController: UIViewController {

    //左侧tableView数据
    var tableViewData = [String]()
    //右侧collectionView数据
    var collectionViewData = [[CommunityTopicModel]]()
    
    /** 左侧tableview */
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.frame = CGRect(x: 0, y: 0, width: 90,height: kScreenH - 108)
        view.rowHeight = 50
        view.showsVerticalScrollIndicator = false
        view.separatorColor = UIColor.clear
        view.register(CommunityCatageryCell.self,forCellReuseIdentifier: "tableViewCell")
        return view
    }()
    
    /** CollectionViewLayout */
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let itemWidth = (kScreenW - 90 - 4 - 4) / 3
        layout.itemSize = CGSize(width: itemWidth,
                                     height: itemWidth)
        return layout
    }()
    
    /** 右侧collectionview */
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect(x: 90 + 2, y: 2, width: kScreenW - 90 - 4, height: kScreenH - 150), collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.clear
        view.register(CommunityTopicCell.self,forCellWithReuseIdentifier: "collectionViewCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化左侧表格数据
        self.tableViewData = ["NBA","国际足球","游戏","综合体育"]
        //初始化右侧表格数据
        self.collectionViewData = [
            [CommunityTopicModel(name: "76人", picture: "76ers"),CommunityTopicModel(name: "灰熊", picture: "bear"),CommunityTopicModel(name: "雄鹿", picture: "buck"),CommunityTopicModel(name: "快船", picture: "clipper"),CommunityTopicModel(name: "小牛", picture: "cow"),CommunityTopicModel(name: "尼克斯", picture: "knicks"),CommunityTopicModel(name: "湖人", picture: "laker"),CommunityTopicModel(name: "魔术", picture: "magic"),CommunityTopicModel(name: "步行者", picture: "pacer"),CommunityTopicModel(name: "猛龙", picture: "raptor"),CommunityTopicModel(name: "火箭", picture: "rocket"),CommunityTopicModel(name: "马刺", picture: "spurs"),CommunityTopicModel(name: "太阳", picture: "suns"),CommunityTopicModel(name: "雷霆", picture: "thunder"),CommunityTopicModel(name: "森林狼", picture: "wolves"),CommunityTopicModel(name: "勇士", picture: "worriors")]
//            [CommunityTopicModel(name: "76人", picture: "76ers")],
//            [CommunityTopicModel(name: "76人", picture: "76ers")],
//            [CommunityTopicModel(name: "76人", picture: "76ers")]
        ]
        
        //将tableView和collectionView添加到页面上
        view.addSubview(tableView)
        view.addSubview(collectionView)
        
        //左侧表格默认选中第一项
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true,
                            scrollPosition: .none)
    }
    
}


// MARK: - UITableViewDelegate,UITableViewDataSource
extension CommunityTopicViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CommunityCatageryCell
        cell.titleLabel.text = tableViewData[indexPath.row]
        return cell
    }
    
    
}

extension CommunityTopicViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1//tableViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CommunityTopicCell
        let model = collectionViewData[indexPath.section][indexPath.row]
        cell.setData(model)
        return cell
    }
    
    
}
