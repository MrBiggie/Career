//
//  VMPickPicturesViewController.swift
//  28DaysCareer
//
//  Created by Xuelin Zhao on 2017/9/18.
//  Copyright © 2017年 zhaoxuelin. All rights reserved.
//

import UIKit
import CoreData

class VMPickPicturesViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    @IBOutlet weak var imageFive: UIImageView!
    @IBOutlet weak var imageSix: UIImageView!
    @IBOutlet weak var editSwitch: UISwitch!
    @IBOutlet weak var imageSeven: UIImageView!
    @IBOutlet weak var imageEight: UIImageView!
    @IBOutlet weak var imageNine: UIImageView!
    @IBOutlet weak var imageTen: UIImageView!
    @IBOutlet weak var imageEleven: UIImageView!
    @IBOutlet weak var imageTwelve: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //pick pictures from Album
    @IBAction func fromAlbum(_ sender: AnyObject) {
        //judge whether support ImagePicker from Album
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //initiate the ImagePicker
            let picker = UIImagePickerController()
            //Set the delegate
            picker.delegate = self
            //Choose the type of imagePickerController
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //Setting editSwitch
            picker.allowsEditing = editSwitch.isOn
            //present
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("Read album error")
        }
        
    }
    
    
    //Choose picture
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //Detail of pictures
        print(info)
        
        //Image
        let image:UIImage!
        if editSwitch.isOn {
            //Get Image after editing
            image = info[UIImagePickerControllerEditedImage] as! UIImage
        }else{
            //Get the original picture
            image = info[UIImagePickerControllerOriginalImage] as! UIImage
        }
        
        if self.imageOne.image == nil{
            self.imageOne.image = image
        }else{
            if self.imageTwo.image == nil{
                self.imageTwo.image = image
            }else{
                if self.imageThree.image == nil{
                    self.imageThree.image = image
                }else{
                    if self.imageFour.image == nil{
                        self.imageFour.image = image
                    }else{
                        if self.imageFive.image == nil{
                            self.imageFive.image = image
                        }else{
                            if self.imageSix.image == nil{
                                self.imageSix.image = image
                            }else{
                                if self.imageSeven.image == nil{
                                    self.imageSeven.image = image
                                }else{
                                    if self.imageEight.image == nil{
                                        self.imageEight.image = image
                                    }else{
                                        if self.imageNine.image == nil{
                                            self.imageNine.image = image
                                        }else{
                                            if self.imageTen.image == nil{
                                                self.imageTen.image = image
                                            }else{
                                                if self.imageEleven.image == nil{
                                                    self.imageEleven.image = image
                                                }else{
                                                    if self.imageTwelve.image == nil{
                                                        self.imageTwelve.image = image
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //Exit the ImagePicker
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
        
    }
    
    //Remove picture
    @IBAction func RemovePicture(_ sender: UIButton) {
        if self.imageTwelve.image == nil{
            if self.imageEleven.image == nil{
                if self.imageTen.image == nil{
                    if self.imageNine.image == nil{
                        if self.imageEight.image == nil{
                            if self.imageSeven.image == nil{
                                if self.imageSix.image == nil{
                                    if self.imageFive.image == nil{
                                        if self.imageFour.image == nil{
                                            if self.imageThree.image == nil{
                                                if self.imageTwo.image == nil{
                                                    if self.imageOne.image == nil{
                                                        
                                                    }else{
                                                        imageOne.image = nil
                                                    }
                                                }else{
                                                    imageTwo.image = nil
                                                }
                                            }else{
                                                imageThree.image = nil
                                            }
                                        }else{
                                            imageFour.image = nil
                                        }
                                    }else{
                                        imageFive.image = nil
                                    }
                                }else{
                                    imageSix.image = nil
                                }
                            }else{
                                imageSeven.image = nil
                            }
                        }else{
                            imageEight.image = nil
                        }
                    }else{
                        imageNine.image = nil
                    }
                }else{
                    imageTen.image = nil
                }
            }else{
                imageEleven.image = nil
            }
        }else{
            imageTwelve.image = nil
        }
    }
    
    //Save pictures
    @IBAction func SavePictures(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
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
            
            //Insert image and save
            let image = NSEntityDescription.insertNewObject(forEntityName: "Image", into: context)
            
            if self.imageOne.image != nil{
                if let imageData1 = UIImageJPEGRepresentation(self.imageOne.image!, 1){
                    image.setValue(imageData1, forKey: "image1")
                    print("image1 set")
                }
            }
            
            
            if self.imageTwo.image != nil{
                if let imageData2 = UIImageJPEGRepresentation(self.imageTwo.image!, 1){
                    image.setValue(imageData2, forKey: "image2")
                    print("image2 set")
                }
            }
            
            if self.imageThree.image != nil{
                if let imageData3 = UIImageJPEGRepresentation(self.imageThree.image!, 1){
                    image.setValue(imageData3, forKey: "image3")
                    print("image3 set")
                }
            }
            
            if self.imageFour.image != nil{
                if let imageData4 = UIImageJPEGRepresentation(self.imageFour.image!, 1){
                    image.setValue(imageData4, forKey: "image4")
                    print("image4 set")
                }
            }
            if self.imageFive.image != nil{
                if let imageData5 = UIImageJPEGRepresentation(self.imageFive.image!, 1){
                    image.setValue(imageData5, forKey: "image5")
                    print("image5 set")
                }
            }
            if self.imageSix.image != nil{
                if let imageData6 = UIImageJPEGRepresentation(self.imageSix.image!, 1){
                    image.setValue(imageData6, forKey: "image6")
                    print("image6 set")
                }
            }
            if self.imageSeven.image != nil{
                if let imageData7 = UIImageJPEGRepresentation(self.imageSeven.image!, 1){
                    image.setValue(imageData7, forKey: "image7")
                    print("image7 set")
                }
            }
            if self.imageEight.image != nil{
                if let imageData8 = UIImageJPEGRepresentation(self.imageEight.image!, 1){
                    image.setValue(imageData8, forKey: "image8")
                    print("image8 set")
                }
            }
            if self.imageNine.image != nil{
                if let imageData9 = UIImageJPEGRepresentation(self.imageNine.image!, 1){
                    image.setValue(imageData9, forKey: "image9")
                    print("image9 set")
                }
            }
            if self.imageTen.image != nil{
                if let imageData10 = UIImageJPEGRepresentation(self.imageTen.image!, 1){
                    image.setValue(imageData10, forKey: "image10")
                    print("image10 set")
                }
            }
            if self.imageEleven.image != nil{
                if let imageData11 = UIImageJPEGRepresentation(self.imageEleven.image!, 1){
                    image.setValue(imageData11, forKey: "image11")
                    print("image11 set")
                }
            }
            if self.imageTwelve.image != nil{
                if let imageData12 = UIImageJPEGRepresentation(self.imageTwelve.image!, 1){
                    image.setValue(imageData12, forKey: "image12")
                    print("image12 set")
                }
            }
            //Save imageData
            try context.save()
            
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
