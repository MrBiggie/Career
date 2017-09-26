//
//  APSummaryViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/26.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import CoreData

class APSummaryViewController: UIViewController {

    
    
    @IBOutlet weak var P1Goal: UILabel!
    
    @IBOutlet weak var P1Date: UILabel!

    @IBOutlet weak var P2Goal: UILabel!
    
    @IBOutlet weak var P2Date: UILabel!
    
    @IBOutlet weak var P3Goal: UILabel!
    
    @IBOutlet weak var P3Date: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "APProject")
        request.returnsObjectsAsFaults = false
      
        var count: Int = 0
        
        do
        {
            let results = try context.fetch(request)
            
            // Show the data
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    count += 1
                    if(count == 1){
                        if let goal = result.value(forKey: "goal") as? String{
                            P1Goal.text = goal
                        }
                        if let date = result.value(forKey: "date") as? String{
                            P1Date.text = date
                        }
                    }
                    if(count == 2){
                        if let goal = result.value(forKey: "goal") as? String{
                            P2Goal.text = goal
                        }
                        if let date = result.value(forKey: "date") as? String{
                            P2Date.text = date
                        }
                    }
                    if(count == 3){
                        if let goal = result.value(forKey: "goal") as? String{
                            P3Goal.text = goal
                        }
                        if let date = result.value(forKey: "date") as? String{
                            P3Date.text = date
                        }
                    }
                }
            }
        }
        catch
        {
            //PROCESS ERROR
        }
        
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
