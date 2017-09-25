//
//  UVMPicturesViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/25.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import CoreData

class UVMPicturesViewController: UIViewController {

    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        request.returnsObjectsAsFaults = false
        do
        {
            //Read imageData
            let results = try context.fetch(request)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    print(result.description)
                    if let imageData1 = result.value(forKey: "image1") as? Data{
                        let image1 = UIImage(data: imageData1)
                        self.imageOne.image = image1
                    }
                    
                    if let imageData2 = result.value(forKey: "image2") as? Data{
                        let image2 = UIImage(data: imageData2)
                        self.imageTwo.image = image2
                    }
                    
                    if let imageData3 = result.value(forKey: "image3") as? Data{
                        let image3 = UIImage(data: imageData3)
                        self.imageThree.image = image3
                    }
                    
                    if let imageData4 = result.value(forKey: "image4") as? Data{
                        let image4 = UIImage(data: imageData4)
                        self.imageFour.image = image4
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
