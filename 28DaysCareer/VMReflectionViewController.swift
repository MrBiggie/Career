//
//  VMReflectionViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/10/15.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit

class VMReflectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}
