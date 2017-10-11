//
//  FinishViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/10/8.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    
    @IBAction func FinishButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
