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
    func pageContentView(contentView: HupuContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int)
}

fileprivate let contentReuseIdentifier = "HUPUContentView"

class HupuContentView: UIView {

    /** 控制器数组 */
    fileprivate var childVcs: [UIViewController]
    /** 控制器 */
    fileprivate weak var parentViewcontroller: UIViewController?
    /** collectionView偏移量 */
    fileprivate var startOffsetX: CGFloat = 0
    /** 是否需要禁止执行代理方法 */
    //当点击label时不需要调用代理方法进行滚动
    fileprivate var isForbidScorllDelegate: Bool = false
    
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
            //避免反复添加
            view.removeFromSuperview()
        }
        let childVC = childVcs[indexPath.row]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbidScorllDelegate = false
        //记录滚动的index
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //判断是否需要滚动
        if isForbidScorllDelegate{
            return
        }
        //根据currentOffsetX计算以下值
        var progress: CGFloat = 0 // 滑动了多少(进度)，用于改变label的颜色，如果滑动不足一个label的宽度则为渐暗色
        var sourceIndex: Int = 0  // 当前在哪个上进行滑动
        var targetIndex: Int = 0  // 滑动到下一个目标值
        /** 判断左滑还是右滑 */
        let currentOffsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        if currentOffsetX > startOffsetX{  //向右，左滑
            //floor向下取整
            progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW)
            sourceIndex = Int(currentOffsetX / scrollViewW)
            //+1 只滑动了一点点的时候会反弹
            targetIndex = sourceIndex + 1
            //防止数组越界
            if targetIndex >= childVcs.count{
                targetIndex = childVcs.count - 1
            }
            //完全滑过去
            if currentOffsetX - startOffsetX == scrollViewW{
                progress = 1
                targetIndex = sourceIndex
            }
        }else{ //向左，右滑
            progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW))
            targetIndex = Int(currentOffsetX / scrollViewW)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count{
                sourceIndex = childVcs.count - 1
            }
        }
        delegate?.pageContentView(contentView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    
    // MARK:- 根据标题标签改变内容
    func fitUIWithProcess(currentIndex: Int){
        // 记录需要禁止
        isForbidScorllDelegate = true
        // 滚到正确位置
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
    }
    
}

