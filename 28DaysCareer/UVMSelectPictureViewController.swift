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
    
    var receivedImage: String = "image0"
    var buttonVisiable: Bool =  true
    
    @IBOutlet weak var PickPicButton: UIButton!
    
    @IBAction func PickPictureHappy(_ sender: UIButton)
    {
        let secondVC: UVMPicturesViewController =  self.storyboard?.instantiateViewController(withIdentifier: "selectpicture") as! UVMPicturesViewController
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func PickPictureInspire(_ sender: UIButton) {
        let secondVC: UVMPicturesViewController =  self.storyboard?.instantiateViewController(withIdentifier: "selectpicture") as! UVMPicturesViewController
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func PickPictureChallenge(_ sender: UIButton) {
        let secondVC: UVMPicturesViewController =  self.storyboard?.instantiateViewController(withIdentifier: "selectpicture") as! UVMPicturesViewController
        secondVC.delegate = self
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
        if (receivedImage != "image0"){
            do
            {
                //Read data
                let results = try context.fetch(request)
                
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        
                        if let imageData = result.value(forKey: receivedImage) as? Data{
                            SelectImageView.image = UIImage(data: imageData)
                        }
                        
                    }
                }
            }
            catch
            {
                //PROCESS ERROR
            }
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
