//
//  UVMPicturesViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/25.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

protocol PictureViewControllerDelegate{
    // protocl function
    func passImageNumber(picture:String, btnvisiable: Bool)
}

import UIKit
import CoreData

class UVMPicturesViewController: UIViewController {

    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    @IBOutlet weak var imageFive: UIImageView!
    @IBOutlet weak var imageSix: UIImageView!
    @IBOutlet weak var imageSeven: UIImageView!
    @IBOutlet weak var imageEight: UIImageView!
    @IBOutlet weak var imageNine: UIImageView!
    @IBOutlet weak var imageTen: UIImageView!
    @IBOutlet weak var imageEleven: UIImageView!
    @IBOutlet weak var imageTwelve: UIImageView!
    
    
    var delegate : PictureViewControllerDelegate?
    var receivedIdentifier: String = "SegueIdentifier"
    
    var spvc: UVMSelectPictureViewController = UVMSelectPictureViewController()
    
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
                print(results.count)
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
                    
                    if let imageData5 = result.value(forKey: "image5") as? Data{
                        let image5 = UIImage(data: imageData5)
                        self.imageFive.image = image5
                        imageFive.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerFive))
                        tapGR.numberOfTapsRequired = 1
                        imageFive.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData6 = result.value(forKey: "image6") as? Data{
                        let image6 = UIImage(data: imageData6)
                        self.imageSix.image = image6
                        imageSix.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerSix))
                        tapGR.numberOfTapsRequired = 1
                        imageSix.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData7 = result.value(forKey: "image7") as? Data{
                        let image7 = UIImage(data: imageData7)
                        self.imageSeven.image = image7
                        imageSeven.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerSeven))
                        tapGR.numberOfTapsRequired = 1
                        imageSeven.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData8 = result.value(forKey: "image8") as? Data{
                        let image8 = UIImage(data: imageData8)
                        self.imageEight.image = image8
                        imageEight.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerEight))
                        tapGR.numberOfTapsRequired = 1
                        imageEight.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData9 = result.value(forKey: "image9") as? Data{
                        let image9 = UIImage(data: imageData9)
                        self.imageNine.image = image9
                        imageNine.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerNine))
                        tapGR.numberOfTapsRequired = 1
                        imageNine.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData10 = result.value(forKey: "image10") as? Data{
                        let image10 = UIImage(data: imageData10)
                        self.imageTen.image = image10
                        imageTen.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerTen))
                        tapGR.numberOfTapsRequired = 1
                        imageTen.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData11 = result.value(forKey: "image11") as? Data{
                        let image11 = UIImage(data: imageData11)
                        self.imageEleven.image = image11
                        imageEleven.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerEleven))
                        tapGR.numberOfTapsRequired = 1
                        imageEleven.addGestureRecognizer(tapGR)
                    }
                    
                    if let imageData12 = result.value(forKey: "image12") as? Data{
                        let image12 = UIImage(data: imageData12)
                        self.imageTwelve.image = image12
                        imageFour.isUserInteractionEnabled = true
                        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandlerTwelve))
                        tapGR.numberOfTapsRequired = 1
                        imageTwelve.addGestureRecognizer(tapGR)
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
        self.delegate?.passImageNumber(picture: "image1", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerTwo
    func tapHandlerTwo(){
        print("tapHandlerTwo")
        self.delegate?.passImageNumber(picture: "image2", btnvisiable: false)
    self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerThree
    func tapHandlerThree(){
        print("tapHandlerThree")
        self.delegate?.passImageNumber(picture: "image3", btnvisiable: false)
    self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerFour
    func tapHandlerFour(){
        print("tapHandlerFour")
        self.delegate?.passImageNumber(picture: "image4", btnvisiable: false)
    self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerFive
    func tapHandlerFive(){
        print("tapHandlerFive")
        self.delegate?.passImageNumber(picture: "image5", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerSix
    func tapHandlerSix(){
        print("tapHandlerSix")
        self.delegate?.passImageNumber(picture: "image6", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerSeven
    func tapHandlerSeven(){
        print("tapHandlerSeven")
        self.delegate?.passImageNumber(picture: "image7", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerEight
    func tapHandlerEight(){
        print("tapHandlerEight")
        self.delegate?.passImageNumber(picture: "image8", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerNine
    func tapHandlerNine(){
        print("tapHandlerNine")
        self.delegate?.passImageNumber(picture: "image9", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerTen
    func tapHandlerTen(){
        print("tapHandlerTen")
        self.delegate?.passImageNumber(picture: "image10", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerEleven
    func tapHandlerEleven(){
        print("tapHandlerEleven")
        self.delegate?.passImageNumber(picture: "image11", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    //tapHandlerTwelve
    func tapHandlerTwelve(){
        print("tapHandlerTwelve")
        self.delegate?.passImageNumber(picture: "image12", btnvisiable: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
