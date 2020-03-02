//
//  HupuPageTitleView.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/2.
//  Copyright © 2020 ZWT. All rights reserved.
//

// MARK:- 页面标题试图

import UIKit

/** 指示器高度 */
private let kScrollLineH: CGFloat = 2
/** 未选中的字体颜色(元组类型) */
private let kNomolColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
/** 选中的字体颜色(元组类型) */
private let kSelectColor: (CGFloat, CGFloat, CGFloat) = (255, 120, 0)

class HupuPageTitleView: UIView {

    /** 滚动视图 */
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        //不显示左右滑动滚条
        scroll.showsHorizontalScrollIndicator = false
        //触摸状态栏回到顶部
        scroll.scrollsToTop = false
        //反弹效果
        scroll.bounces = false
        return scroll
    }()
    
    /** 滑动指示器 */
    fileprivate lazy var scollLine: UIView = {
        let scollLine = UIView()
        scollLine.backgroundColor = UIColor.orange
        return scollLine
    }()
    
    /** 标题标签数组 */
    lazy var titleLabels = [UILabel]()
    
    /** 标题数组 */
    fileprivate var titles: [String]
    
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
        scrollView.frame = bounds
        self.addSubview(scrollView)
        
        addTitleLabels()
        addBottomLine()
    }
    
    /** 添加标题标签 */
    func addTitleLabels(){
        
        //label的宽度
        let labelW = frame.width / CGFloat(titles.count)
        //label的高度
        let labelH = frame.height - kScrollLineH
        //label的纵向偏移量
        let labelY: CGFloat = 0
        
        //遍历标题数组
        for (index,title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            //视图的标志（Int类型，默认等于0），设置后，可以通过viewWithTag方法拿到这个视图
            label.tag = index
            label.textAlignment = .center
            label.textColor = UIColor(r: kNomolColor.0, g: kNomolColor.1, b: kNomolColor.2)
            //label的frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
            //把label加入label数组中，后续可取出label的text
            titleLabels.append(label)
            //为label添加手势触发事件
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelClicked)))
        }
    }
    
    /** 添加下滑条 */
    func addBottomLine(){
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let linH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - linH, width: frame.width, height: linH)
        addSubview(bottomLine)
        // 2、添加滑动指示器
        // 2.1获取第一个label
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        // 2.2设置滑动指示器的属性
        scrollView.addSubview(scollLine)
        scollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        
    }
    
    /** label点击事件 */
    @objc func labelClicked(){
        print("labelClick....")
    }
    
}


extension UIColor {
    // convenience 扩展遍历构造函数
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    // 随机色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
