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
    var flag = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
       
        // Video Path
        let filePath = Bundle.main.path(forResource: "introduction", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
        // Video player
        player = AVPlayer(url: videoURL)
        
        if flag{
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
            flag = false
        }
        
//        // Size an location
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        // Add to view
//        self.view.layer.addSublayer(playerLayer)
//        // Play
//        player?.play()
    }
    
    @IBAction func PlayVideo(_ sender: UIButton) {
       flag = true
        if flag{
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
            flag = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
