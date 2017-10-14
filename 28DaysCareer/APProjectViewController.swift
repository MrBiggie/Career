//
//  APProjectViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/25.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import CoreData

class APProjectViewController: UIViewController {

    
    @IBOutlet weak var ProjectGoal: UITextField!
    
  
    @IBOutlet weak var APOne: UITextView!
    
    @IBOutlet weak var APTwo: UITextView!
    
    @IBOutlet weak var APThree: UITextView!
    
    
    
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

    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBAction func SelectDate(_ sender: UIButton) {
        let alertController:UIAlertController=UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        // initiate datePicker
        let datePicker = UIDatePicker( )
        // Set language
        datePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale
        // date mode
        datePicker.datePickerMode = UIDatePickerMode.date
        // default date
        datePicker.date = NSDate() as Date
        // Alert
        alertController.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default){
            (alertAction)->Void in
            //print("date select: \(datePicker.date.description)")
            
            let dateFormatter = DateFormatter()
            
            //Format the date
            dateFormatter.dateFormat = "MM/dd/YYYY"
            let stringDate: String = dateFormatter.string(from: datePicker.date)
            // 09/26/2017
            print(stringDate)
            self.DateLabel.text = stringDate
            
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel,handler:nil))
        
        alertController.view.addSubview(datePicker)
        
        self.present(alertController, animated: true, completion: nil)
    }

    // Save the information
    @IBAction func SaveButton(_ sender: UIButton) {
        deletePrevious()
        InsertAndSave()
        
    }
    
    
    @IBAction func AP23SaveButton(_ sender: UIButton) {
        InsertAndSave()
    }
    
    
    
    func InsertAndSave(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "APProject")
        request.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(request)
            
            // Show the data
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    print(result.description)
                }
            }
            
            
            //Insert Career and save
            let item = NSEntityDescription.insertNewObject(forEntityName: "APProject", into: context)
            item.setValue(ProjectGoal.text, forKey: "goal")
            item.setValue(DateLabel.text, forKey: "date")
            item.setValue(APOne.text, forKey: "ap1")
            item.setValue(APTwo.text, forKey: "ap2")
            item.setValue(APThree.text, forKey: "ap3")
            item.setValue(Mastermind.text, forKey: "mastermind")
            
           
            
            try context.save()
        }
        catch
        {
            //PROCESS ERROR
        }
    }
    
    func deletePrevious(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "APProject")
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
            try context.save()
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
