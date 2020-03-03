//
//  HupuPageContentView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/2.
//  Copyright © 2020 ZWT. All rights reserved.
//

// MARK:- 界面内容视图

import UIKit

/** 协议 */
protocol HupuContentViewDelegate: class {
    func pageContentView(titleView: HupuContentView, selectedIndex: Int)
}

fileprivate let contentReuseIdentifier = "HUPUContentView"

class HupuContentView: UIView {

    /** 控制器数组 */
    fileprivate var childVcs: [UIViewController]
    /** 控制器 */
    fileprivate weak var parentViewcontroller: UIViewController?
    
    /** PageContentView代理属性 */
    weak var delegate: HupuContentViewDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentReuseIdentifier)
        return collectionView
    }()
    
    
    init(frame: CGRect, childVcs: [UIViewController], parentViewcontrol:UIViewController?) {
        self.childVcs = childVcs
        self.parentViewcontroller = parentViewcontrol
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        // 1、把控制器数组中遍历出来的所有控制做为子控制器添加到父控制器上
        for childVc in childVcs {
            parentViewcontroller?.addChild(childVc)
        }
        // 2、添加UICollectionView，用于，在Cell中存放控制器的View
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK:- UICollectionViewDataSource, UICollectionViewDelegate
extension HupuContentView: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentReuseIdentifier, for: indexPath)
        //给cell设置内容
        for view in cell.contentView.subviews {
            // 因为重复添加，所以还是删除比较好
            view.removeFromSuperview()
        }
        let childVC = childVcs[indexPath.row]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
}
