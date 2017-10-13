//
//  WLBWheelViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/17.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//
import UIKit
import TKRadarChart
import CoreData

class WLBWheelViewController: UIViewController, TKRadarChartDataSource, TKRadarChartDelegate, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.bounds.width
    
        let chart = TKRadarChart(frame: CGRect(x: 0, y: 0, width: w, height: w))
        chart.configuration.radius = w/3.5
        chart.dataSource = self
        chart.delegate = self
        chart.center = view.center
        chart.reloadData()
        view.addSubview(chart)
    }
    
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 10
    }
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 8
    }
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 1
    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        if(row == 0){
            return "Career"
        }
        if(row == 1){
            return "Family"
        }
        if(row == 2){
            return "Spirituality"
        }
        if(row == 3){
            return "Learning"
        }
        if(row == 4){
            return "Finance"
        }
        if(row == 5){
            return "Fun"
        }
        if(row == 6){
            return "Health"
        }
        if(row == 7){
            return "Friends"
        }
        return "Nil"
    }
    
    
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
        //Show the Item details
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WLBItem")
        request.returnsObjectsAsFaults = false
        
        
        if section == 0 {
            do
            {
                let results = try context.fetch(request)
                
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        if let careerValue = result.value(forKey: "career") as? Int16  {
                            if row == 0{
                            return CGFloat(careerValue/2)
                            }
                        }
                        if let familyValue = result.value(forKey: "family") as? Int16{
                            if row == 1{
                                return CGFloat(familyValue/2)
                            }
                        }
                        if let spiritualityValue = result.value(forKey: "spirituality") as? Int16{
                            if row == 2{
                                return CGFloat(spiritualityValue/2)
                            }
                        }
                        if let learningValue = result.value(forKey: "learning") as? Int16{
                            if row == 3{
                                return CGFloat(learningValue/2)
                            }
                        }
                        if let financeValue = result.value(forKey: "finance") as? Int16{
                            if row == 4{
                                return CGFloat(financeValue/2)
                            }
                        }
                        if let funValue = result.value(forKey: "fun") as? Int16{
                            if row == 5{
                                return CGFloat(funValue/2)
                            }
                        }
                        if let healthValue = result.value(forKey: "health") as? Int16{
                            if row == 6{
                                return CGFloat(healthValue/2)
                            }
                        }
                        if let friendsValue = result.value(forKey: "friends") as? Int16{
                            if row == 7{
                                return CGFloat(friendsValue/2)
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
        return 3
    }
    
    func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor(red:0.337,  green:0.847,  blue:0.976, alpha:1)
    }
    
    func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
        switch step {
        case 1:
            return UIColor(red:0.545,  green:0.906,  blue:0.996, alpha:1)
        case 2:
            return UIColor(red:0.706,  green:0.929,  blue:0.988, alpha:1)
        case 3:
            return UIColor(red:0.831,  green:0.949,  blue:0.984, alpha:1)
        case 4:
            return UIColor(red:0.922,  green:0.976,  blue:0.988, alpha:1)
        default:
            return UIColor.white
        }
    }
    
    func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:0.867,  blue:0.012, alpha:0.4)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:0.4)
        }
    }
    
    func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:0.867,  blue:0.012, alpha:1)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:1)
        }
    }
    
    func colorOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor.black
    }
    
    func fontOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIFont {
        return UIFont(name: "AppleGothic", size: 15)!
    }
    
    
}
