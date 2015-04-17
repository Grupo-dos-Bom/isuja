//
//  Cloth.swift
//  iSuja
//
//  Created by Diego Silva de Carvalho on 15/04/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class Cloth {
    var name: String
    var image: UIImage
    var usedTimes = 0
    
    

    
    init (name:String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    func increaseUsedTimes() {
        self.usedTimes++;
    }
    
    func washCloth () {
        self.usedTimes = 0;
    }
    
}
