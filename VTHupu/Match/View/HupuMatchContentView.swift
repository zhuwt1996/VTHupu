//
//  HupuPageContentView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/2.
//  Copyright © 2020 ZWT. All rights reserved.
//

// MARK:- 界面内容视图

import UIKit

class HupuMatchContentView: UIView {

    /** 控制器数组 */
    fileprivate var childVcs: [UIViewController]
    /** 控制器 */
    fileprivate weak var parentViewcontrol: UIViewController?
    
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
        return collectionView
    }()
    
    
    init(frame: CGRect, childVcs: [UIViewController], parentViewcontrol:UIViewController?) {
        self.childVcs = childVcs
        self.parentViewcontrol = parentViewcontrol
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        // 1、把控制器数组中遍历出来的所有控制做为子控制器添加到父控制器上
        for childVc in childVcs {
            parentViewcontrol?.addChild(childVc)
        }
        // 2、添加UICollectionView，用于，在Cell中存放控制器的View
        addSubview(collectionView)
    }
}

// MARK:- UICollectionViewDataSource, UICollectionViewDelegate
extension HupuMatchContentView: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentReuseIdentifier", for: indexPath)
        //给cell设置内容
        for view in cell.contentView.subviews {
            // 因为重复添加，所以还是删除比较好
            view.removeFromSuperview()
        }
        let childVC = childVcs[indexPath.row]
        cell.contentView.addSubview(childVC.view)
        return cell
    }
    
    
}
