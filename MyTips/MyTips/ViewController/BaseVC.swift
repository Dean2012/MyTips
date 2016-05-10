//
//  BaseVC.swift
//  MyTips
//
//  Created by Dean on 16/5/9.
//  Copyright © 2016年 Dean. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var titleName : String = ""
    
    let screenSize = UIScreen.mainScreen().bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        navigationItem.title = titleName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}