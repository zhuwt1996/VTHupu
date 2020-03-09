//
//  HUPUFootballViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/3.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUFootballViewController: UIViewController {

    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.text = "国际足球"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 250, width: kScreenW, height: 50)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
    }
}
