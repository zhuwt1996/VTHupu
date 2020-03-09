//
//  HUPUVedioViewController.swift
//  VTHupu
//
//  Created by ZWT on 2020/3/3.
//  Copyright © 2020 ZWT. All rights reserved.
//

import UIKit

class HUPUVedioViewController: UIViewController {

    lazy var headView: HUPUHeadView = {
        let view = HUPUHeadView(frame: CGRect(x: 0, y: 20, width: kScreenW, height: 60))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(headView)
    }
    
}
