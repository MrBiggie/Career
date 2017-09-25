//
//  APProjectViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/25.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit

class APProjectViewController: UIViewController {

    
    @IBOutlet weak var ProjectGoal: UITextField!
    
    @IBOutlet weak var APOne: UITextField!
    
    @IBOutlet weak var APTwo: UITextField!
    
    @IBOutlet weak var APThree: UITextField!
    
    @IBOutlet weak var Mastermind: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectGoal.layer.borderColor = UIColor.blue.cgColor
        ProjectGoal.layer.borderWidth = 1
        ProjectGoal.layer.cornerRadius = 10
        
        APOne.layer.borderColor = UIColor.blue.cgColor
        APOne.layer.borderWidth = 1
        APOne.layer.cornerRadius = 10
        
        APTwo.layer.borderColor = UIColor.blue.cgColor
        APTwo.layer.borderWidth = 1
        APTwo.layer.cornerRadius = 10
        
        APThree.layer.borderColor = UIColor.blue.cgColor
        APThree.layer.borderWidth = 1
        APThree.layer.cornerRadius = 10
        
        Mastermind.layer.borderColor = UIColor.blue.cgColor
        Mastermind.layer.borderWidth = 1
        Mastermind.layer.cornerRadius = 16
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
