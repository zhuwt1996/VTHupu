//
//  HUPUMatchViewCell.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/5.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUMatchViewCell: UICollectionViewCell {
    
    lazy var lab: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.textColor = UIColor(r: kNomolColor.0, g: kNomolColor.1, b: kNomolColor.2)
        lab.frame = contentView.frame
        return lab
    }()
    
    lazy var scrollLine: UIView = {
        let line = UIView()
        line.frame = CGRect(x: 0, y: contentView.frame.height - kScrollLineH, width:contentView.frame.width, height: kScrollLineH)
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(lab)
        contentView.addSubview(scrollLine)
    }
}
