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
