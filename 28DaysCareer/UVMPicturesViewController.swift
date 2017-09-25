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
    
    var receivedIdentifier: String = "SegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(receivedIdentifier)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        request.returnsObjectsAsFaults = false
        do
        {
            //Read data
            let results = try context.fetch(request)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let imageData1 = result.value(forKey: "image1") as? Data{
                        let image1 = UIImage(data: imageData1)
                        self.imageOne.image = image1
                        imageOne.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerOne))
                        tapGR.numberOfTapsRequired = 1
                        imageOne.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData2 = result.value(forKey: "image2") as? Data{
                        let image2 = UIImage(data: imageData2)
                        self.imageTwo.image = image2
                        imageTwo.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerTwo))
                        tapGR.numberOfTapsRequired = 1
                        imageTwo.addGestureRecognizer(tapGR)
                        
                    }
                    
                    if let imageData3 = result.value(forKey: "image3") as? Data{
                        let image3 = UIImage(data: imageData3)
                        self.imageThree.image = image3
                        imageThree.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerThree))
                        tapGR.numberOfTapsRequired = 1
                        imageThree.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData4 = result.value(forKey: "image4") as? Data{
                        let image4 = UIImage(data: imageData4)
                        self.imageFour.image = image4
                        imageFour.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerFour))
                        tapGR.numberOfTapsRequired = 1
                        imageFour.addGestureRecognizer(tapGR)
                        
                    }
                }
            }
        }
        catch
        {
            //PROCESS ERROR
        }
        
    }
    
    //tapHandlerOne
    func tapHandlerOne(){
        print("tapHandlerOne")
        let VC = self.storyboard?.instantiateViewController(withIdentifier: receivedIdentifier) as! UVMSelectPictureViewController
        VC.receivedImage = "ImageOne"
        VC.buttonVisiable = false
        self.present(VC, animated: true, completion: nil)
    }
    
    //tapHandlerTwo
    func tapHandlerTwo(){
        print("tapHandlerTwo")
        let VC = self.storyboard?.instantiateViewController(withIdentifier: receivedIdentifier) as! UVMSelectPictureViewController
        VC.receivedImage = "ImageTwo"
        VC.buttonVisiable = false
        self.present(VC, animated: true, completion: nil)
    }
    
    //tapHandlerThree
    func tapHandlerThree(){
        print("tapHandlerThree")
        let VC = self.storyboard?.instantiateViewController(withIdentifier: receivedIdentifier) as! UVMSelectPictureViewController
        VC.receivedImage = "ImageThree"
        VC.buttonVisiable = false
        self.present(VC, animated: true, completion: nil)
    }
    
    //tapHandlerFour
    func tapHandlerFour(){
        print("tapHandlerFour")
        let VC = self.storyboard?.instantiateViewController(withIdentifier: receivedIdentifier) as! UVMSelectPictureViewController
        VC.receivedImage = "ImageFour"
        VC.buttonVisiable = false
        self.present(VC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
