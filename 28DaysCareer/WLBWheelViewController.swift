//
//  WLBWheelViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/17.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//
import UIKit
import CoreData
import PieCharts

class WLBWheelViewController: UIViewController, UITableViewDelegate,PieChartDelegate {
    
    var career:Double = 5
    var family:Double = 5
    var spirituality:Double = 5
    var learning:Double = 5
    var finance:Double = 5
    var fun:Double = 5
    var health:Double = 5
    var friends:Double = 5
    
    let chartView: PieChart = PieChart(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/4, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getValue()
        self.view.addSubview(chartView)
    }
    
    @IBAction func StartNewWLB(_ sender: UIButton) {
        setDefaultValue()
    }
    
    func getValue(){
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
                    if let careerValue = result.value(forKey: "career") as? Double  {
                        career = careerValue
                    }
                    if let familyValue = result.value(forKey: "family") as? Double{
                        family = familyValue
                    }
                    if let spiritualityValue = result.value(forKey: "spirituality") as? Double{
                        spirituality = spiritualityValue
                    }
                    if let learningValue = result.value(forKey: "learning") as? Double{
                        learning = learningValue
                    }
                    if let financeValue = result.value(forKey: "finance") as? Double{
                        finance = financeValue
                    }
                    if let funValue = result.value(forKey: "fun") as? Double{
                        fun = funValue
                    }
                    if let healthValue = result.value(forKey: "health") as? Double{
                        health = healthValue
                    }
                    if let friendsValue = result.value(forKey: "friends") as? Double{
                        friends = friendsValue
                    }
                }
            }
        }
        catch
        {
            //PROCESS ERROR
        }
    }
    
    func setDefaultValue(){
        let sliderValue: Double = 5.0
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        //Requst
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WLBItem")
        request.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(request) as! [WLBItem]
            // Insert
            if results.count == 0{
                let item = NSEntityDescription.insertNewObject(forEntityName: "WLBItem", into: context)
                item.setValue(5, forKey: "career")
                item.setValue(5, forKey: "family")
                item.setValue(5, forKey: "spirituality")
                item.setValue(5, forKey: "learning")
                item.setValue(5, forKey: "finance")
                item.setValue(5, forKey: "fun")
                item.setValue(5, forKey: "health")
                item.setValue(5, forKey: "friends")
                item.setValue(true, forKey: "careerslider")
                item.setValue(true, forKey: "familyslider")
                item.setValue(true, forKey: "spiritualityslider")
                item.setValue(true, forKey: "learningslider")
                item.setValue(true, forKey: "financeslider")
                item.setValue(true, forKey: "funslider")
                item.setValue(true, forKey: "healthslider")
                item.setValue(true, forKey: "friendsslider")
                try context.save()
            }
            //Update
            if results.count > 0{
                for result in results {
                    result.career = sliderValue
                    result.family = sliderValue
                    result.spirituality = sliderValue
                    result.learning = sliderValue
                    result.finance = sliderValue
                    result.fun = sliderValue
                    result.health = sliderValue
                    result.friends = sliderValue
                    result.careerslider = true
                    result.familyslider = true
                    result.spiritualityslider = true
                    result.learningslider = true
                    result.financeslider = true
                    result.funslider = true
                    result.healthslider = true
                    result.friendsslider = true
                    
                    try context.save()
                }
            }
        }
        catch
        {
            //PROCESS ERROR
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
        chartView.delegate = self
        chartView.models = createModels() // order is important - models have to be set at the end
    }
    
    // MARK: - PieChartDelegate
    
    func onSelected(slice: PieSlice, selected: Bool) {
        print("Selected: \(selected), slice: \(slice)")
    }
    
    // MARK: - Models
    
    fileprivate func createModels() -> [PieSliceModel] {
        let alpha: CGFloat = 0.5
        
        return [
            PieSliceModel(value: career, color: UIColor.yellow.withAlphaComponent(alpha)),
            PieSliceModel(value: family, color: UIColor.blue.withAlphaComponent(alpha)),
            PieSliceModel(value: spirituality, color: UIColor.green.withAlphaComponent(alpha)),
            PieSliceModel(value: learning, color: UIColor.cyan.withAlphaComponent(alpha)),
            PieSliceModel(value: finance, color: UIColor.red.withAlphaComponent(alpha)),
            PieSliceModel(value: fun, color: UIColor.magenta.withAlphaComponent(alpha)),
            PieSliceModel(value: health, color: UIColor.orange.withAlphaComponent(alpha)),
            PieSliceModel(value: friends, color: UIColor.purple.withAlphaComponent(alpha))
        ]
    }
    
    // MARK: - Layers
    
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer {
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 135
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
    
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 60
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
    
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            
            let container = UIView()
            container.frame.size = CGSize(width: 100, height: 40)
            container.center = center
            let alpha: CGFloat = 0.5
            if true {
                let specialTextLabel = UILabel()
                specialTextLabel.textAlignment = .center
                if slice.data.id == 0 {
                    specialTextLabel.textColor = UIColor.yellow.withAlphaComponent(alpha)
                    specialTextLabel.text = "Career"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 1 {
                    specialTextLabel.textColor = UIColor.blue.withAlphaComponent(alpha)
                    specialTextLabel.text = "Family"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 2 {
                    specialTextLabel.textColor = UIColor.green.withAlphaComponent(alpha)
                    specialTextLabel.text = "Spirituality"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 3 {
                    specialTextLabel.textColor = UIColor.cyan.withAlphaComponent(alpha)
                    specialTextLabel.text = "Learning"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 4 {
                    specialTextLabel.textColor = UIColor.red.withAlphaComponent(alpha)
                    specialTextLabel.text = "Finance"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 5 {
                    specialTextLabel.textColor = UIColor.magenta.withAlphaComponent(alpha)
                    specialTextLabel.text = "Fun"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 6 {
                    specialTextLabel.textColor = UIColor.orange.withAlphaComponent(alpha)
                    specialTextLabel.text = "Health"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }else if slice.data.id == 7 {
                    specialTextLabel.textColor = UIColor.purple.withAlphaComponent(alpha)
                    specialTextLabel.text = "Friends"
                    specialTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
                }
                
                specialTextLabel.sizeToFit()
                specialTextLabel.frame = CGRect(x: 0, y: 30, width: 100, height: 20)
                container.addSubview(specialTextLabel)
                container.frame.size = CGSize(width: 100, height: 60)
            }
            return container
        }
    }
    
    
}
