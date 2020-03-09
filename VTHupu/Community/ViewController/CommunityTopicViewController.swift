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

    /** 左侧tableView数据 */
    var tableViewData = [String]()
    /** 右侧collectionView数据 */
    var collectionViewData = [[CommunityTopicModel]]()
    /** 右侧collectionView当前是否正在向下滚动（即true表示手指向上滑动，查看下面内容） */
    var collectionViewIsScrollDown = true
    /** 右侧collectionView垂直偏移量 */
    var collectionViewLastOffsetY : CGFloat = 0.0
    
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
        layout.itemSize = CGSize(width: itemWidth,height: itemWidth)
        
        //分组头悬停
        layout.sectionHeadersPinToVisibleBounds = true
        return layout
    }()
    
    /** 右侧collectionview */
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect(x: 90 + 2, y: 2, width: kScreenW - 90 - 4, height: kScreenH - 150), collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.clear
        view.register(CommunityTopicCell.self,forCellWithReuseIdentifier: "collectionViewCell")
        view.register(CommunityTopicHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "collectionViewHeader")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化左侧表格数据
        self.tableViewData = ["NBA","国际足球","游戏","综合体育"]
        //初始化右侧表格数据
        self.collectionViewData = CommunityTopicModel.initWithDataSource()
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //右侧的collectionview滑动到对应的位置
//        scrollCollectionView(section: indexPath.section,animated: true)
        collectionView.scrollToItem(at: IndexPath(item: 0, section: indexPath.row), at: .top, animated: true)
    }
    
//    func scrollCollectionView(section: Int,animated: Bool){
//        let scrollOffset = getHeightOfSection(section: section)
//        let topOfHeader = CGPoint(x: 0, y: scrollOffset.origin.y - collectionView.contentInset.top)
//        collectionView.setContentOffset(topOfHeader, animated: animated)
//    }
//
//    func getHeightOfSection(section: Int) -> CGRect{
//        let indexPath = IndexPath(item: 0, section: section)
//        let attributes = collectionView.collectionViewLayout
//            .layoutAttributesForSupplementaryView(ofKind:
//                UICollectionView.elementKindSectionHeader, at: indexPath)
//        guard let frameForFirstCell = attributes?.frame else {
//            return .zero
//        }
//        return frameForFirstCell
//    }
    
}

extension CommunityTopicViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tableViewData.count
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
    
    //添加分区头
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: UIScreen.main.bounds.width, height: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        let view = collectionView.dequeueReusableSupplementaryView(ofKind:
            UICollectionView.elementKindSectionHeader,withReuseIdentifier: "collectionViewHeader",for: indexPath) as! CommunityTopicHeader
        view.titleLabel.text = tableViewData[indexPath.section]
        return view
    }
    
    
    //分区头即将显示时调用
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath){
        //如果是由用户手动滑动屏幕造成的向上滚动，那么左侧表格自动选中该分区对应的分类
        if !collectionViewIsScrollDown
            && (collectionView.isDragging || collectionView.isDecelerating) {
            tableView.selectRow(at: IndexPath(row: indexPath.section, section: 0),
                                animated: true, scrollPosition: .top)
        }
    }
    
    //分区头即将消失时调用
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath){
        //如果是由用户手动滑动屏幕造成的向下滚动，那么左侧表格自动选中该分区对应的下一个分区的分类
        if collectionViewIsScrollDown
            && (collectionView.isDragging || collectionView.isDecelerating) {
            tableView.selectRow(at: IndexPath(row: indexPath.section + 1, section: 0),
                                animated: true, scrollPosition: .top)
        }
    }
    
    //视图滚动时记录滑动方向
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView == scrollView{
            
            collectionViewIsScrollDown =  collectionViewLastOffsetY < scrollView.contentOffset.y
            collectionViewLastOffsetY = scrollView.contentOffset.y
        }
    }
    
}
