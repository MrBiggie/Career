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
    var career:Double = 5
    var family:Double = 5
    var spirituality:Double = 5
    var learning:Double = 5
    var finance:Double = 5
    var fun:Double = 5
    var health:Double = 5
    var friends:Double = 5
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var careerSlider: UISlider!
    @IBOutlet weak var familySlider: UISlider!
    @IBOutlet weak var spiritualitySlider: UISlider!
    @IBOutlet weak var learningSlider: UISlider!
    @IBOutlet weak var financeSlider: UISlider!
    @IBOutlet weak var funSlider: UISlider!
    @IBOutlet weak var healthSlider: UISlider!
    @IBOutlet weak var friendsSlider: UISlider!
    
    var careerSliderEnable = true
    var familySliderEnable = true
    var spiritualitySliderEable = true
    var learningSliderEnable = true
    var financeSliderEnable = true
    var funSliderEnable = true
    var healthSliderEnable = true
    var friendsSliderEnable = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(sliderValueChange), for: UIControlEvents.valueChanged)
    }

    func sliderValueChange(slider:UISlider)
    {
        scoreLabel.text = "Score: " + String(Int(slider.value))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getValue()
        self.setSlider()
        scoreLabel.text = "Score: " + String(Int(slider.value))
    }
    
    @IBAction func CareerButton(_ sender: UIButton) {
        updateItems(Type: "career")
        careerSlider.isEnabled = false
    }
    
    @IBAction func FamilyButton(_ sender: UIButton) {
        updateItems(Type: "family")
        familySlider.isEnabled = false
    }
    
    @IBAction func SpiritualityButton(_ sender: UIButton) {
        updateItems(Type: "spirituality")
        spiritualitySlider.isEnabled = false
    }
    
    @IBAction func LearningButton(_ sender: UIButton) {
        updateItems(Type: "learning")
        learningSlider.isEnabled = false
    }
    
    @IBAction func FinanceButton(_ sender: UIButton) {
        updateItems(Type: "finance")
        financeSlider.isEnabled = false
    }
    
    @IBAction func FunButton(_ sender: UIButton) {
        updateItems(Type: "fun")
        funSlider.isEnabled = false
    }
    
    @IBAction func HealthButton(_ sender: UIButton) {
        updateItems(Type: "health")
        healthSlider.isEnabled = false
    }
    
    @IBAction func FriendsButton(_ sender: UIButton) {
        updateItems(Type: "friends")
        friendsSlider.isEnabled = false
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
            
            // Update
            if results.count > 0{
                for result in results {
                    if Type == "career"{
                        result.career = sliderValue
                        result.careerslider = false
                    }
                    if Type == "family"{
                        result.family = sliderValue
                        result.familyslider = false
                    }
                    if Type == "spirituality"{
                        result.spirituality = sliderValue
                        result.spiritualityslider = false
                    }
                    if Type == "learning"{
                        result.learning = sliderValue
                        result.learningslider = false
                    }
                    if Type == "finance"{
                        result.finance = sliderValue
                        result.financeslider = false
                    }
                    if Type == "fun"{
                        result.fun = sliderValue
                        result.funslider = false
                    }
                    if Type == "health"{
                        result.health = sliderValue
                        result.healthslider = false
                    }
                    if Type == "friends"{
                        result.friends = sliderValue
                        result.friendsslider = false
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
    
    func setSlider(){
        if(itemTitle.text == "Question1 Career"){
            slider.value = Float(career)
            slider.isEnabled = careerSliderEnable
        }
        else if(itemTitle.text == "Question2 Family"){
            slider.value = Float(family)
            slider.isEnabled = familySliderEnable
        }
        else if(itemTitle.text == "Question3 Spirituality"){
            slider.value = Float(spirituality)
            slider.isEnabled = spiritualitySliderEable
        }
        else if(itemTitle.text == "Question4 Learning"){
           slider.value = Float(learning)
            slider.isEnabled = learningSliderEnable
        }
        else if(itemTitle.text == "Question5 Finance"){
            slider.value = Float(finance)
            slider.isEnabled = financeSliderEnable
        }
        else if(itemTitle.text == "Question6 Fun"){
            slider.value = Float(fun)
            slider.isEnabled = funSliderEnable
        }
        else if(itemTitle.text == "Question7 Health"){
            slider.value = Float(health)
            slider.isEnabled = healthSliderEnable
        }
        else if(itemTitle.text == "Question8 Friends"){
            slider.value = Float(friends)
            slider.isEnabled = friendsSliderEnable
        }
        
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
                    print(result.description)
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
                    if let enable = result.value(forKey: "careerslider") as? Bool{
                        careerSliderEnable = enable
                    }
                    if let enable = result.value(forKey: "familyslider") as? Bool{
                        familySliderEnable = enable
                    }
                    if let enable = result.value(forKey: "spiritualityslider") as? Bool{
                        spiritualitySliderEable = enable
                    }
                    if let enable = result.value(forKey: "learningslider") as? Bool{
                        learningSliderEnable = enable
                    }
                    if let enable = result.value(forKey: "financeslider") as? Bool{
                        financeSliderEnable = enable
                    }
                    if let enable = result.value(forKey: "funslider") as? Bool{
                        funSliderEnable = enable
                    }
                    if let enable = result.value(forKey: "healthslider") as? Bool{
                        healthSliderEnable = enable
                    }
                    if let enable = result.value(forKey: "friendsslider") as? Bool{
                        friendsSliderEnable = enable
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
