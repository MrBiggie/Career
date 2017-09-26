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
    
    @IBOutlet weak var IntroductionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default URL
        var URL: URL = Bundle.main.url(forResource: "Four_Seasons_Autumn_Movt_1", withExtension: "mp3")!
        
        // Choose Audio URL accordiong to the title
        if(IntroductionLabel.text == "Work-life Balance"){
            URL = Bundle.main.url(forResource: "wlbintroduction", withExtension: "m4a")!
        }
        
        if(IntroductionLabel.text == "Relaxation"){
            URL = Bundle.main.url(forResource: "Four_Seasons_Autumn_Movt_1", withExtension: "mp3")!
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: URL)
            player?.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
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
    
}
