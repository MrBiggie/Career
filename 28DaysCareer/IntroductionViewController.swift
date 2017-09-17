//
//  IntroductionViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/7.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //hi
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var player:AVPlayer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
       
      //定义一个视频文件路径
        let filePath = Bundle.main.path(forResource: "introduction", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
        //定义一个视频播放器，通过本地文件路径初始化
        player = AVPlayer(url: videoURL)
        //设置大小和位置（全屏）
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        //添加到界面上
        self.view.layer.addSublayer(playerLayer)
        //开始播放
        player?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }
    
    
}
