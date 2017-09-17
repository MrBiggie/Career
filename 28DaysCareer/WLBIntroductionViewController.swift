//
//  WLBIntroductionViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/7.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import AVFoundation


class WLBIntroductionViewController: UIViewController {
    
        
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "wlbintroduction", withExtension: "m4a")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }

        
       /* //隐藏系统的导航栏 不然点击事件受到影响
        self.navigationController?.isNavigationBarHidden=true
        // 创建一个导航栏
        let navBar = UINavigationBar(frame: CGRect(x:0, y:20, width:self.view.frame.size.width, height:180))
        // 导航栏背景颜色
        navBar.backgroundColor = UIColor.init(red: 255.0/225.0, green: 127.0/225.0, blue: 80.0/225.0, alpha: 1.0)
        
        let bootomBar = UINavigationBar(frame: CGRect(x: 0, y: self.view.frame.size.height-180, width: self.view.frame.size.width, height: 180))
        bootomBar.backgroundColor = UIColor.init(red: 237.0/225.0, green: 82.0/225.0, blue: 51.0/225.0, alpha: 1.0)
        //这里是导航栏透明
        //navBar.shadowImage = UIImage()
        //navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 自定义导航栏的title，用UILabel实现
        let titleLabel = UILabel(frame: CGRect(x:0,y:0,width:200,height:100))
        titleLabel.text = "Worklife Balance"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        //这里使用系统自定义的字体
    //titleLabel.font = UIFont(name:"Zapfino", size: 25)
        
        // 创建导航栏组件
        let navItem = UINavigationItem()
        // 设置自定义的title
        navItem.titleView = titleLabel
        
        // 创建左侧按钮
        //let leftButton = UIBarButtonItem(title: "leftButton", style: .plain, target: self, action: nil)
        //leftButton.tintColor = UIColor.red
        
        // 创建右侧按钮
        //let rightButton = UIBarButtonItem(title: "rightButton", style: .plain, target: self, action: nil)
        //rightButton.tintColor = UIColor.red
        
        // 添加左侧、右侧按钮
        //navItem.setLeftBarButton(leftButton, animated: false)
        //navItem.setRightBarButton(rightButton, animated: false)
        
        navigationItem.setHidesBackButton(true, animated: false)
        // 把导航栏组件加入导航栏
        navBar.pushItem(navItem, animated: false)
       
        // 导航栏添加到view上
        self.view.addSubview(navBar)
        self.view.addSubview(bootomBar) */
    
    }
    
  
    @IBAction func AudioPlayButton(_ sender: UIButton) {
        if(player?.isPlaying)!{
            player?.pause()
        }else{
            player?.play()
        }
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.stop()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
