//
//  WLBItemViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/16.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import CoreData

class WLBItemViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Show the Item details
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WLBItem")
        request.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    print(result.description)
                }
            }
        }
        catch
        {
            //PROCESS ERROR
        }
        
        
    }
    
    @IBAction func CareerButton(_ sender: UIButton) {
        let sliderValue: Int16 = Int16(Int(slider.value))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WLBItem")
        request.returnsObjectsAsFaults = false
        do
        {
            //Delete previous data
            let results = try context.fetch(request)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    context.delete(result)
                }
            }
            //Insert Career and save
            let item = NSEntityDescription.insertNewObject(forEntityName: "WLBItem", into: context)
            item.setValue(sliderValue, forKey: "career")
            try context.save()
            
        }
        catch
        {
            //PROCESS ERROR
        }
    }
    
    @IBAction func FamilyButton(_ sender: UIButton) {
        updateItems(Type: "family")
    }
    
    @IBAction func SpiritualityButton(_ sender: UIButton) {
        updateItems(Type: "spirituality")
    }
    
    @IBAction func LearningButton(_ sender: UIButton) {
        updateItems(Type: "learning")
    }
    
    @IBAction func FinanceButton(_ sender: UIButton) {
        updateItems(Type: "finance")
    }
    
    @IBAction func FunButton(_ sender: UIButton) {
        updateItems(Type: "fun")
    }
    
    @IBAction func HealthButton(_ sender: UIButton) {
        updateItems(Type: "health")
    }
    
    @IBAction func FriendsButton(_ sender: UIButton) {
        updateItems(Type: "friends")
    }
    
    @IBOutlet weak var slider: UISlider!
    
    func updateItems(Type : String){
        let sliderValue: Double = Double(slider.value)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        //Requst
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WLBItem")
        request.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(request) as! [WLBItem]
            //Update
            if results.count > 0{
                for result in results {
                    if Type == "family"{
                        result.family = sliderValue
                    }
                    if Type == "spirituality"{
                        result.spirituality = sliderValue
                    }
                    if Type == "learning"{
                        result.learning = sliderValue
                    }
                    if Type == "finance"{
                        result.finance = sliderValue
                    }
                    if Type == "fun"{
                        result.fun = sliderValue
                    }
                    if Type == "health"{
                        result.health = sliderValue
                    }
                    if Type == "friends"{
                        result.friends = sliderValue
                    }
                    try context.save()
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
