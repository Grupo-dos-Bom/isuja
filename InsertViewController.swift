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
    var mediaUI = UIImagePickerController();
    
    let dataManager = DataManager.sharedInstance
    
    var pickedImage : UIImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        self.saveButton.hidden = true;
        self.nameTextField.delegate = self;
    }
    
    @IBAction func pickFromCam(sender: AnyObject) {
        
        
        mediaUI.delegate = self;
        mediaUI.mediaTypes = [kUTTypeImage];
        
        mediaUI.sourceType = UIImagePickerControllerSourceType.Camera;
        mediaUI.allowsEditing = false;
        mediaUI.cameraCaptureMode = .Photo
        
        //let image = mediaUI[UIImagePickerControllerOriginalImage] as UIImage
        
         self.presentViewController(mediaUI, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        pickedImage = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        imageField.image = image
        
        self.saveButton.hidden = false;
    }
   
    @IBAction func saveHandler(sender: AnyObject) {
        var name = nameTextField.text;
        let color = UIColor.blackColor();
        //let imagePath = String("/Users/davirdgs/Documents/iSuja/isuja/iSuja icons/Socks.png");
        
        dataManager.addCloth(name,image: pickedImage)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
