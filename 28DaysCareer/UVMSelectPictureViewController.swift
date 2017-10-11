//
//  UVMSelectPictureViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/25.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import CoreData

class UVMSelectPictureViewController: UIViewController, PictureViewControllerDelegate {

    var receivedImage: String = "ImageZero"
    var buttonVisiable: Bool =  true
    
    @IBOutlet weak var PickPicButton: UIButton!
    
    @IBAction func PickPictureHappy(_ sender: UIButton)
        {
            let secondVC: UVMPicturesViewController =  self.storyboard?.instantiateViewController(withIdentifier: "selectpicture") as! UVMPicturesViewController
                secondVC.delegate = self
//                secondVC.receivedIdentifier = "Happy"
//                secondVC.spvc = self
                //self.present(secondVC, animated: true, completion: nil)
            self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func PickPictureInspire(_ sender: UIButton) {
        let secondVC: UVMPicturesViewController =  self.storyboard?.instantiateViewController(withIdentifier: "selectpicture") as! UVMPicturesViewController
        secondVC.delegate = self
//        secondVC.receivedIdentifier = "Inspire"
//        secondVC.spvc = self
//        self.present(secondVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func PickPictureChallenge(_ sender: UIButton) {
       let secondVC: UVMPicturesViewController =  self.storyboard?.instantiateViewController(withIdentifier: "selectpicture") as! UVMPicturesViewController
        secondVC.delegate = self
        //secondVC.receivedIdentifier = "Challenge"
        //secondVC.spvc = self
        //self.present(secondVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

    @IBOutlet weak var SelectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if buttonVisiable == false{
            PickPicButton.setTitle(" ", for: .normal)
        }
        print(receivedImage)
        // Do any additional setup after loading the view.
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
                    
                    if(receivedImage == "ImageOne"){
                        if let imageData1 = result.value(forKey: "image1") as? Data{
                            let image1 = UIImage(data: imageData1)
                            SelectImageView.image = image1
                        }
                    }
                    
                    if(receivedImage == "ImageTwo"){
                        if let imageData2 = result.value(forKey: "image2") as? Data{
                            let image2 = UIImage(data: imageData2)
                            SelectImageView.image = image2
                            
                        }
                    }
                    
                    if(receivedImage == "ImageThree"){
                        if let imageData3 = result.value(forKey: "image3") as? Data{
                            let image3 = UIImage(data: imageData3)
                            SelectImageView.image = image3
                        }
                    }
                    
                    if(receivedImage == "ImageFour"){
                        if let imageData4 = result.value(forKey: "image4") as? Data{
                            let image4 = UIImage(data: imageData4)
                            SelectImageView.image = image4
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
    
    
    
    func passImageNumber(picture: String, btnvisiable: Bool) {
        print(picture)
        self.receivedImage = picture
        self.buttonVisiable = btnvisiable
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let secondVC: UVMPicturesViewController = segue.destination as? UVMPicturesViewController{
//            secondVC.receivedIdentifier = segue.identifier!
//            secondVC.spvc = self
//        }
//    }

    
}
