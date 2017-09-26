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
    
    var player:AVPlayer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
       
        // Video Path
        let filePath = Bundle.main.path(forResource: "introduction", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
        // Video player
        player = AVPlayer(url: videoURL)
        // Size an location
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        // Add to view
        self.view.layer.addSublayer(playerLayer)
        // Play
        player?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
