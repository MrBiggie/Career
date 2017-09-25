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
    
    @IBOutlet weak var editSwitch: UISwitch!
    
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
