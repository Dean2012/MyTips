//
//  ViewController.swift
//  MyTips
//
//  Created by Dean on 16/5/9.
//  Copyright © 2016年 Dean. All rights reserved.
//

import UIKit

class MainVC: BaseVC, UIScrollViewDelegate {
    var calendarSC:UIScrollView?
    var curView:calendarView?
    var lastView:calendarView?
    
    var isRunning:Bool = false
    var changeMonth:Int = 0
    var dayList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLayer();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
//    myFunc
    func initLayer() {
        createNavitem()
//        上半部分日历
//        中间ChangeMode
        let changeMode_btn = UIButton(frame: CGRect(x: screenSize.width*0.5-100, y: screenSize.height*0.6, width: 200, height: 40 ))
        self.view.addSubview(changeMode_btn)
        changeMode_btn.setTitle("Change Mode", forState: UIControlState.Normal)
        changeMode_btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        changeMode_btn.adjustsImageWhenHighlighted=true
        changeMode_btn.addTarget(self, action: #selector(MainVC.fnChangeMode(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
//        最下面回到今日
        let backToday_btn = UIButton(frame: CGRect(x: screenSize.width*0.5-100, y: (changeMode_btn.center.y+60) , width: 200, height: 40 ))
        self.view.addSubview(backToday_btn)
        backToday_btn.setTitle("回到今天", forState: UIControlState.Normal)
        backToday_btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        backToday_btn.adjustsImageWhenHighlighted=true
        backToday_btn.addTarget(self, action: #selector(MainVC.fnBackToday(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func createNavitem() {
        //设置导航栏标题
        navigationItem.title = "Main Page"
        //        左上角 个人信息
        let left_Btn = UIBarButtonItem(title: "Person", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MainVC.fnGotoPerson(_:)))
        //        右上角 设置
        let right_Btn = UIBarButtonItem(title: "Setting", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MainVC.fnGotoSetting(_:)))
        
        navigationItem.setLeftBarButtonItem(left_Btn, animated: true)
        navigationItem.setRightBarButtonItem(right_Btn, animated: true)
    }

//    Button Call Back
    func fnChangeMode(sender: UIButton!) {
        NSLog("fnChangeMode")
        let myStatus = sender.state
        sender.setTitleColor(UIColor.blueColor(), forState: myStatus)
        
        NetworkController.sharedInstance.fnHttpTest("")
    }
    
    func fnBackToday(sender: UIButton!) {
        NSLog("fnBackToday")
        let myStatus = sender.state
        sender.setTitleColor(UIColor.blueColor(), forState: myStatus)
        
    }
    
    func fnGotoPerson(sender: UIBarButtonItem!) {
        NSLog("fnGotoPerson")
        
        let vcPerson = PersonVC()
        self.navigationController!.pushViewController(vcPerson, animated: true)
//        self.showViewController(vcPerson, sender: nil)
//        self.presentViewController(vcPerson, animated: true, completion: nil)
    }
    
    func fnGotoSetting(sender: UIBarButtonItem) {
        NSLog("fnGotoSetting")
        
        let vcSetting = SettingVC()
        self.navigationController!.pushViewController(vcSetting, animated: true)
    }
}

