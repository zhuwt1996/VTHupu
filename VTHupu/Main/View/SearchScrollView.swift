//
//  SearchScrollView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/9.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit


/// 滚动分享
///
/// - up: 上翻
/// - down: 下翻
enum ScrollDirection {
    case up
    case down
}

class SearchScrollView: UIView,UIScrollViewDelegate {
    
    
    /** 滚动label */
    lazy var lab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.gray
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 12)
        return lab
    }()
    
    /** 计时器 */
    private var timer: Timer?
    
    /** 间隔时间 */
    public var timeInteval: TimeInterval?
    
    /** 滚动方向,默认向上滚动 */
    public var direction: ScrollDirection = .up
    
    /** 数据源 */
    public var dataSource: [String]?{
        didSet {
            guard dataSource?.count != 0 else {
                return
            }
            currentIndex = 0
            addDataToLabel(currentIndex)
            createTimer()
        }
    }
    
    /** 记录当前index */
    private var currentIndex: NSInteger = 0
    
    /** 滚动视图 */
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isUserInteractionEnabled = false
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        scrollView.contentOffset = CGPoint(x: 0, y: self.frame.height)
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
        scrollView.addSubview(lab)
        lab.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: self.frame.height)
    }
    
    func addDataToLabel(_ index: NSInteger){
        lab.text = dataSource?[index]
    }
    
    fileprivate func createTimer(){
        timer = Timer(timeInterval: timeInteval!, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        //添加到主程序中
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    @objc func autoScroll(){
        if direction == ScrollDirection.down{
            //向下滚动
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }else{
            //向上滚动
            scrollView.setContentOffset(CGPoint(x: 0, y: 2 * self.frame.height), animated: true)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //减速滑动完成调用
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //切换label的text
        if direction == .up{
            currentIndex = (currentIndex + 1) % (dataSource?.count)!
        }else{
            currentIndex = (currentIndex - 1 + (dataSource?.count)!) % (dataSource?.count)!
        }
        addDataToLabel(currentIndex)
        scrollView.setContentOffset(CGPoint(x: 0, y: self.frame.height), animated: false)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndDecelerating(scrollView)
    }
    
}
