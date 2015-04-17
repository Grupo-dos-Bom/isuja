//
//  InsertViewController.swift
//  iSuja
//
//  Created by Davi Rodrigues on 15/04/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit
import CoreImage
import MobileCoreServices

class InsertViewController: UIViewController, UIImagePickerControllerDelegate , UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageField: UIImageView!
    
    
    let dataManager = DataManager.sharedInstance
    
    @IBAction func pickFromCam(sender: AnyObject) {
        
        var mediaUI = UIImagePickerController();
        mediaUI.delegate = self;
        mediaUI.mediaTypes = [kUTTypeImage];
        
        mediaUI.sourceType = UIImagePickerControllerSourceType.Camera;
        mediaUI.allowsEditing = false;
        
        self.imageField.image = (UIImage*) [info, objectForKey:UIImagePickerControllerOriginalImage];
        
        //self.presentViewController(mediaUI, animated: true, completion: nil);
    }
    
   
    @IBAction func saveHandler(sender: AnyObject) {
        var name = nameTextField.text;
        let color = UIColor.blackColor();
        let imagePath = String("/Users/davirdgs/Documents/iSuja/isuja/iSuja icons/Socks.png");
        dataManager.addCloth(name,image: imagePath,type: Cloth.clothType.shirt,color: color)
    }
}
