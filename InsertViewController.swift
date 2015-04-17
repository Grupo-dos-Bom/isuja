//
//  InsertViewController.swift
//  iSuja
//
//  Created by Davi Rodrigues on 15/04/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit
import CoreImage

class InsertViewController: UIViewController, UIImagePickerControllerDelegate , UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let dataManager = DataManager.sharedInstance
    
//    @IBAction func pickFromCam(sender: AnyObject) {
//        let mediaUI = UIImagePickerController();
//        mediaUI.sourceType = UIImagePickerControllerSourceTypeCamera;
//        mediaUI.delegate = self;
//        //[self presentViewController:mediaUI animated:YES completion:nil]
//        mediaUI.presentViewController.animated = YES;
//        self.mediaUI.presentViewController.completion = nil;
//    }
    
   
    @IBAction func saveHandler(sender: AnyObject) {
        var name = nameTextField.text;
        let color = UIColor.blackColor();
        let imagePath = String("/Users/davirdgs/Documents/iSuja/isuja/iSuja icons/Socks.png");
        dataManager.addCloth(name,image: imagePath,type: Cloth.clothType.shirt,color: color)
    }
}
