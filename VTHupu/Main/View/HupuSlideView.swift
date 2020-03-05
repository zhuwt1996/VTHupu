//
//  HupuSlideView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/4.
//  Copyright © 2020 ZWT. All rights reserved.
//

// MARK:- 顶部标签栏，可点击切换，可滑动切换

import UIKit

private let contentReuseIdentifier = "HupuSlideView"

/** 协议 */
protocol HupuSlideViewDelegate: class {
    func hupuSlideView(slideView: HupuSlideView, selectedIndex: Int)
}

class HupuSlideView: UIView {
    
    /** 标题数组 */
    fileprivate var titles: [String]
    
    /** 标题标签数组 */
    lazy var titleLabels = [UILabel]()
    
    /** 当前选中label下标 */
    fileprivate var currentIndex: Int = 0
    
    /** collectionView偏移量 */
    fileprivate var startOffsetX: CGFloat = 0
    
    /** PageContentView代理属性 */
    weak var delegate: HupuSlideViewDelegate?

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: CGFloat(70), height: self.bounds.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        collectionView.register(HUPUMatchViewCell.self, forCellWithReuseIdentifier: contentReuseIdentifier)
        return collectionView
    }()
    
    /** 滑动指示器 */
    fileprivate lazy var scollLine: UIView = {
        let scollLine = UIView()
        scollLine.backgroundColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        return scollLine
    }()
    
    /** 自定义构造函数 */
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
//        addTitleLabels()
        
        addSubview(collectionView)
        collectionView.frame = bounds
        
        addBottomLine()
        
    }
    
    /** 添加标题标签 */
//    func addTitleLabels(){
//
//        //遍历标题数组
//        for (index,title) in titles.enumerated(){
//            let label = UILabel()
//            label.text = title
//            //视图的标志（Int类型，默认等于0），设置后，可以通过viewWithTag方法拿到这个视图
//            label.tag = index
//            label.textAlignment = .center
//            label.textColor = UIColor(r: kNomolColor.0, g: kNomolColor.1, b: kNomolColor.2)
//
//            //把label加入label数组中，后续可取出label的text
//            titleLabels.append(label)
//            //为label添加手势触发事件
//            label.isUserInteractionEnabled = true
//            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.labelClicked(gesture:)))
//            label.addGestureRecognizer(gesture)
//        }
//    }
//
    /** 添加下滑条 */
    func addBottomLine(){
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let linH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - linH, width: frame.width, height: linH)
        addSubview(bottomLine)
        
//        addSubview(scollLine)
//        //添加滑动指示器
//        scollLine.frame = CGRect(x: 0, y: frame.height - kScrollLineH, width:CGFloat(70), height: kScrollLineH)
    }
    
    /** label点击事件 */
    @objc func labelClicked(gesture: UITapGestureRecognizer){
        //获取到点击到label
        guard let currentLabel = gesture.view as? UILabel else{return}
        //获取上一点击到label，切换字体颜色
        let oldLabel = titleLabels[currentIndex]
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLabel.textColor = UIColor(r: kNomolColor.0, g: kNomolColor.1, b: kNomolColor.2)
        //保存新的下标
        currentIndex = currentLabel.tag
        
        //指示器移动
        let scrollLineX = CGFloat(currentLabel.tag) * scollLine.frame.width
        //动画效果
        UIView.animate(withDuration: 0.25) {
            self.scollLine.frame.origin.x = scrollLineX
        }
        //发送通知
        delegate?.hupuSlideView(slideView: self, selectedIndex: currentIndex)
    }
    
    // MARK:- 根据内容改标标题标签
    func fitSlideWithProcess(progress: CGFloat, sourceIndex: Int, targetIndex: Int){
        //取出sourcelabel和targetlabel，分别改变颜色
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        // 取出变化的范围
        let colorDelte = (kSelectColor.0 - kNomolColor.0, kSelectColor.1 - kNomolColor.1, kSelectColor.2 - kNomolColor.2)
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelte.0 * progress, g: kSelectColor.1 - colorDelte.1 * progress, b: kSelectColor.2 - colorDelte.2 * progress)
        targetLabel.textColor = UIColor(r: kNomolColor.0 + colorDelte.0 * progress, g: kNomolColor.1 + colorDelte.1 * progress, b: kNomolColor.2 + colorDelte.2 * progress)
        
        //滑动滑块
        let moveX = progress * sourceLabel.frame.width
        if targetIndex < sourceIndex{
            //左移
            scollLine.frame.origin.x = CGFloat(sourceIndex) * sourceLabel.frame.width  - moveX
        }else if targetIndex > sourceIndex{
            //右移
            scollLine.frame.origin.x = CGFloat(sourceIndex) * sourceLabel.frame.width + moveX
        }
        
        
        // 记录最新的Index(否则会出现bug）
        currentIndex = targetIndex
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HupuSlideView: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentReuseIdentifier, for: indexPath)
        //给cell设置内容
        for view in cell.contentView.subviews {
            //避免反复添加
            view.removeFromSuperview()
        }
//        cell.lab.text = titles[indexPath.row]
//
//        cell.scrollLine.isHidden = false
        let titleLab = titleLabels[indexPath.row]
        titleLab.frame = cell.contentView.bounds
        //获取第一个label
        if indexPath.row == 0{
            titleLab.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        }
        cell.contentView.addSubview(titleLab)
        cell.contentView.backgroundColor = UIColor.white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentReuseIdentifier, for: indexPath)
        var offsetX = cell.center.x - (kScreenW - 50) * 0.5
        // 如果标签旁边没有剩余标签，则不滚动
        if offsetX < 0 {
            offsetX = 0
        }
        //点击label以后需要调整label的位置：如果label的中心点大于frame的一半，则需要进行调整
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
}
